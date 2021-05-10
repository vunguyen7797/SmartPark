"use strict";

const express = require("express");
const sqlite3 = require('sqlite3');
const argon2 = require("argon2");
const app = express();
const util = require('util');
const session = require('express-session');
const crypto = require('crypto');
const WebSocket = require("ws");

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
const port = 8080;

const server = app.listen(port, () => {
    console.log(`Server listening on ${port}!`);
  });
  
  const wsServer = new WebSocket.Server({ server });
  

//const wsServer = new WebSocket.Server({ noServer:true });

function sendData(ws, rows){
 
    if (ws.readyState === WebSocket.OPEN) {
        console.log("Sending data now ...")
        ws.send(JSON.stringify(rows));
    } else
        console.log("Cannot send data to client!")
        
}

const db = new sqlite3.Database('./Database/PKLotInfo.db', (err) => {
    if (err) {
      return console.error(err.message);
    }
    console.log('Connected to the database.');
});

db.asyncExec = util.promisify(db.exec);
db.asyncGet = util.promisify(db.get);
db.asyncAll = util.promisify(db.all);
db.asyncRun = util.promisify(db.run);

wsServer.on("connection", async (ws, req) => {
    try {
        console.log('On connection');
        const rows = await db.asyncAll(`
            SELECT * FROM parkingLotInfo
         
            `);
        ws.send(JSON.stringify(rows));
    } catch(err){
        const errorObject = {error: "Could not access database"};
        ws.send(JSON.stringify(errorObject));
    }
});

async function deleteData() {
    await db.asyncExec(`DELETE FROM parkingLotInfo`, (err) => {
        if(err){
            return console.error(err);
        }
        console.log("Deleted all the rows from parkingLotInfo");
    });
}
// deleteData();

async function insertData(adminID, username, email, passwordHash) {
    await db.asyncExec(`
        INSERT INTO admins 
        VALUES ('${adminID}', '${username}', '${email}', '${passwordHash}', 1)
        `, (err) => {
        if(err){
            return console.error(err);
        }
        console.log("Query insereted successfully!");
    });
}
// insertData();


app.post('/data', async (req, res) => {
    deleteData();
    try{
        // console.log(req.headers);
        // console.log(req.body);

        const messageBody = req.body;
        for(const message of messageBody){
            // console.log(message);
            await db.asyncExec(`INSERT INTO parkingLotInfo 
            VALUES ('${message.name}', '${message.location}', '${message.status}', '${message.reserve_status}')`);
        }
        const rows = await db.asyncAll(`
        SELECT * FROM parkingLotInfo
     
        `);
        console.log("Receive data from classifier. Send to client...")
        wsServer.clients.forEach((client) => {
            if (client.readyState === WebSocket.OPEN) {
              client.send(JSON.stringify(rows));
            }
          });
      
        res.status(200).send("Request Ok!");
    } catch(err){
        console.error(err);
        res.status(400).send("Bad Request");
    }
});




async function insertPI(piID, publicKey) {
    try{
    await db.asyncExec(`
            INSERT INTO registerPI 
            VALUES ('${piID}', '${publicKey}')
            ON CONFLICT(piID) DO UPDATE
            SET publicKey = '${publicKey}'
            WHERE piID = '${piID}'
        `);
    } catch(err){
        console.error(err);
        return err;
    }
}
insertPI("123456", "000000");

//Create a new admin
app.post("/admin", async (req, res) => {
	console.log("POST /admin");
    if(!req.session){
        return res.sendStatus(403);
    }

	const {username, password, email} = req.body;
    const adminID = uuidV4();

	try {
		const passwordHash = await argon2.hash(password, {hashLength: 5});
        await db.asyncExec(`
            INSERT INTO users
            VALUES ('${adminID}', '${username}', '${email}', '${passwordHash}')
        `);
	} catch (err) {
		console.error(err);
		return res.sendStatus(500);
	}
});

//Admin login
app.post('/login', async (req, res) => {
    const {email, password} = req.body;

    try {
        const row = await db.asyncGet(`
            SELECT * FROM admins
            WHERE email = '${email}'
        `);
        if(!row){
            return res.sendStatus(400);
        }

        const {passwordHash} = row;

        if ( await argon2.verify(passwordHash, password) ) {
			req.session.regenerate(function(err) { 
				if(err){
					console.log(err);
					return res.sendStatus(500);
				}
				req.session.adminID = row.adminID;
				req.session.email = email;
				req.session.username = row.username;
				req.session.role = row.role;
				req.session.loggedIn = true;
                return res.sendStatus(200);
				// return res.redirect('/success.html');
			});
		} else {
			return res.sendStatus(400);
		}
    } catch (err) {
		console.error(err);
		return res.sendStatus(500);
	}
});

//Add PI to the database
app.post('/addPI/:piID', async (req, res) => {
    console.log("POST /addPI");
    if(!req.session){
        return res.sendStatus(403);
    }

    // const { privateKey, publicKey } = crypto.generateKeyPairSync('ec', {
    //     namedCurve: 'sect239k1'
    // });

    const piID = req.params;
    try{
        await db.asyncExec(`
            INSERT INTO registerPI
            VALUES (${piID}, "000000")
        `);
        return res.sendStatus(200);
    } catch(err){
        console.error(err);
        return res.sendStatus(400);
    }
});

//generate pi's security keys
app.get("/piIdentification/:piID", async (req, res) => {
    const piID = req.params;
    const allPIs = await db.asyncAll(`
        SELECT * FROM registerPI
    `);

    for(const pi of allPIs){
        if(piID === pi.piID){
            const { privateKey, publicKey } = crypto.generateKeyPairSync('ec', {
                namedCurve: 'sect239k1'
            });
            await db.asyncExec(`
                UPDATE registerPI
                SET publicKey = '${publicKey}'
                WHERE piID = '${piID}'
            `);
            const resObject = {privateKey, publicKey};
            return res.send(JSON.stringify(resObject));
        }
    }

    return res.sendStatus(400);
});

app.get('/', (req, res) => {
    res.send('Hello!');
});

// let values;
app.get('/data', async (req, res) => {
    const rows = await db.asyncAll(`SELECT * FROM parkingLotInfo`);
    // console.log(rows);
    return res.send(JSON.stringify(rows));
});

//Send the spaces which are empty.
app.get('/emptyspaces', async (req, res) => {
    const rows = await db.asyncAll(`
        SELECT * FROM parkingLotInfo
        WHERE status = 0 AND reserve_status = 0
        `);
    // console.log(rows);
    return res.send(JSON.stringify(rows));
});

//get request for coordinates
app.get('/parkingspace/:name', async (req, res) => {
    const name = req.params.name;
    name = encodeURIComponent(name);
    try{
        const parkingSpaceCoordinate = await db.asyncAll(`
            SELECT * FROM parkingLotInfo
            WHERE name = '${name}'
        `);
        return res.send(JSON.stringify(rows));
    } catch(err){
        console.log(err);
        res.status(400).send("Bad Request");
    }
});

// Route to insert number of spaces
app.post('/spaces/:pID', async (req, res) => {
    const signature = req.body;
    const piID = req.params.pID;
    
    const verify = crypto.createVerify('SHA256');
    verify.write('some data to sign');
    verify.end();
    const publicKey = await db.asyncGet(`
        SELECT publicKey FROM registerPI
        WHERE piID = '${pID}'
    `);
    console.log(verify.verify(publicKey, signature, 'hex'));
    if(verify.verify(publicKey, signature, 'hex')){
        const {totalNumber, location} = req.body;
        location = encodeURIComponent(location);
        if(Number.isInteger(totalNumber) && totalNumber > 0){
            for(let i = 1; i <= totalNumber; ++i){
                await db.asyncExec(`
                    INSERT INTO parkingLotInfo 
                    VALUES ('${location}_${i}', '${location}')`, (err) => {
                        //Library_1
                    if(err){
                        return console.error(err);
                    }
                    console.log("Query insereted successfully!");
                });
                // await db.asyncExec(`
                //     INSERT INTO parkingSpaceCoordinates 
                //     VALUES (${location}_${i})`, (err) => {
                //     if(err){
                //         return console.error(err);
                //     }
                //     console.log("Query insereted successfully!");
                // });
            }
            return res.sendStatus(200);
        }
        return res.sendStatus(400);
    }
    return res.sendStatus(400);
});

// Route to update reserve status
app.post('/updatereservestatus/:name/status/:reservestatus', async (req, res) => {
    const name = req.params.name;
    const reserveStatus = req.params.reservestatus;
    try{
        name = encodeURIComponent(name);
        reserveStatus = encodeURIComponent(reserveStatus);
        await db.asyncExec(`
            UPDATE parkingLotInfo
            SET reserve_ststus = '${reserveStatus}'
            WHERE name = '${name}'
        `);
        try {
            const rows = await db.asyncAll(`
                SELECT * FROM parkingLotInfo
                WHERE status = 0 AND reserve_status = 0
                `);
            wsServer.clients.forEach((ws) => {
                if (ws.isAlive === false) return ws.terminate();
                if (ws.readyState === WebSocket.OPEN) {
                    ws.send(JSON.stringify(rows));
                }
            });
        } catch(err){
            const errorObject = {error: "Could not access database"};
            wsServer.clients.forEach((ws) => {
                if (ws.isAlive === false) return ws.terminate();
                if (ws.readyState === WebSocket.OPEN) {
                    ws.send(JSON.stringify(errorObject));
                }
            });
        }
        
        return res.sendStatus(200);
    } catch(err){
        return res.sendStatus(400);
    }
});

// Route to insert updated parking space data
app.post('/data/:piID', async (req, res) => {
    let signature, publicKey;
    let data = req.body.data;
    data = data.toString();
    const piID = req.params.piID;
    
    const verify = crypto.createVerify('SHA256');
    verify.write(data);
    verify.end();
    try{
        publicKey = await db.asyncGet(`
            SELECT publicKey FROM registerPI
            WHERE piID = '${pID}'
        `);
        signature = req.body.sign;
    } catch(err){
        console.error(err);
        return res.sendStatus(500);
    }
    console.log(verify.verify(publicKey, signature, 'hex'));
    if(verify.verify(publicKey, signature, 'hex')){
        try{
            // console.log(req.headers);
            // console.log(req.body);
            const messageBody = data.split(",");
            for(const message of messageBody){
                if((message.status === 0 || message.status === 1) 
                && (message.reserve_status === 0 || message.reserve_status === 1)){
                    message.name = encodeURIComponent(message.name);
                    message.location = encodeURIComponent(message.location);
                    // console.log(message);
                    await db.asyncExec(`
                        INSERT INTO parkingLotInfo 
                            VALUES ('${message.name}', '${message.location}', '${message.status}', '${message.reserve_status}')
                        ON CONFLICT(name) DO UPDATE 
                            SET status = '${message.status}', reserve_status = '${message.reserve_status}'
                        WHERE name LIKE '${message.name}'
                    `);
                    // console.log("updated");
                }
            }
            return res.status(200).send("Request Ok!");
        } catch(err){
            console.error(err);
            return res.status(400).send("Bad Request");
        }
    }
});

// messageBody {
//     text: "text used to create the sign",
//     sign: "sign",
//     data: "actual data that needs to be added in database"
// }

// UPDATE parkingLotInfo
//                     SET status = '${message.status}', reserve_status = '${message.reserve_status}'
//                     WHERE name LIKE '${message.name}'

// INSERT INTO parkingLotInfo 
//                     VALUES ('${message.name}', '${message.location}', '${message.status}', '${message.reserve_status}')
//                 ON CONFLICT(name) DO UPDATE 
//                     SET status = '${message.status}', reserve_status = '${message.reserve_status}'
//                 WHERE name LIKE '${message.name}'`);

// Route to all coordinates to the database
app.post('/coordinates', async (request, response) => {
    const messageBody = request.body;
    try{
        for(const message of messageBody){
            message.name = encodeURIComponent(message.name);
            await db.asyncExec(`
                UPADTE parkingSpaceCoordinates
                SET x_coordinate1 = '${message.x_coordinate1}',
                    y_coordinate1 = '${message.y_coordinate1}',
                    x_coordinate2 = '${message.x_coordinate2}',
                    y_coordinate2 = '${message.y_coordinate2}',
                    x_coordinate3 = '${message.x_coordinate3}',
                    y_coordinate3 = '${message.y_coordinate3}',
                    x_coordinate4 = '${message.x_coordinate4}',
                    y_coordinate4 = '${message.y_coordinate4}'
                WHERE spaceID = '${message.name}'
            `);
        }
        res.status(200).send("Request Ok!");
    } catch(err){
        console.log(err);
        res.status(400).send("Bad Request");
    }
});

