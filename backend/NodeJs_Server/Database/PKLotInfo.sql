CREATE TABLE IF NOT EXISTS parkingLotInfo (
    name TEXT PRIMARY KEY,
    location TEXT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT 0,
    reserve_status BOOLEAN DEFAULT 1
);

CREATE TABLE IF NOT EXISTS parkingSpaceCoordinates (
    spaceID TEXT PRIMARY KEY,
    x_coordinate1 INTEGER,
    y_coordinate1 INTEGER,
    x_coordinate2 INTEGER,
    y_coordinate2 INTEGER,
    x_coordinate3 INTEGER,
    y_coordinate3 INTEGER,
    x_coordinate4 INTEGER,
    y_coordinate4 INTEGER
);

CREATE TABLE IF NOT EXISTS registerPI (
    piID TEXT PRIMARY KEY,
    publicKey TEXT
);

CREATE TABLE IF NOT EXISTS admins (
    adminID TEXT PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    passwordHash TEXT NOT NULL,
    role INTEGER NOT NULL DEFAULT 1 -- default to "admin" role
);