const express = require("express");
const sqlite3 = require('sqlite3');
const app = express();
const util = require('util');
const fs = require('fs').promises;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
const port = 8080;

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

async function deleteData() {
    await db.asyncExec(`DELETE FROM parkingLotInfo`, (err) => {
        if(err){
            return console.error(err);
        }
        console.log("Deleted all the rows from parkingLotInfo");
    });
}
deleteData();

async function insertData(name, location, status, reserve_status) {
    await db.asyncExec(`INSERT INTO parkingLotInfo VALUES (${name}, ${location}, ${status}, ${reserve_status})`, (err) => {
        if(err){
            return console.error(err);
        }
        console.log("Query insereted successfully!");
    });
}
// insertData();



app.get('/', (req, res) => {
    res.send('Hello!');
});

// let values;
app.get('/data', async (req, res) => {
    const rows = await db.asyncAll(`SELECT * FROM parkingLotInfo`);
    // console.log(rows);
    return res.send(JSON.stringify(rows));
});

app.post('/data', async (req, res) => {
    try{
        // console.log(req.headers);
        // console.log(req.body);
        const messageBody = req.body;
        for(const message of messageBody){
            // console.log(message);
            await db.asyncExec(`INSERT INTO parkingLotInfo 
            VALUES ('${message.name}', '${message.location}', '${message.status}', '${message.reserve_status}')`);
        }
        res.status(200).send("Request Ok!");
    } catch(err){
        console.error(err);
        res.status(400).send("Bad Request");
    }
});

app.listen(port, () => {
  console.log(`Server listening on ${port}!`);
});
