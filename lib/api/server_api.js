const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const { use } = require('express/lib/application');
const res = require('express/lib/response');

const app = express();
app.use(bodyParser.json());

// MySQL Connection
const Connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'attendace_app'
});

Connection.connect((err) => {
    if (err) {
        console.error('Error connection to MySQL:' + err.stack);
        return;
    }
    console.log('Connected to MySQL database.')
});

//Create    

app.post('/create', (req, res)=>{
    const {NIP, username, user_pass, email, birth, address, no_phone} = req.body;
    Connection.query('INSERT INTO users(NIP, username, user_pass, email, birth, address, no_phone) VALUES (?, ?, ?, ?, ?, ?, ?)',
    [NIP, username, user_pass, email, birth, address, no_phone],
    (error, results)=>{
        if (error) {
            res.status(500).json({error: 'Failed to create user.'});
            return;
        }
        res.status(201).json({message: 'User create successfully.'});
    });
});

// Read

app.get('/users', (req, res)=>{
    Connection.query('SELECT * FROM users', (error, results)=>{
        if(error){
            res.status(500).json({error: 'Failed to ferch users.'});
            return;
        }
        res.status(200).json(results);
    });
});


// Update
app.put('/update/:NIP', (req, res)=>{
  const NIP = req.params.NIP;
  const {username, user_pass, email, birth, address, no_phone} = req.body;
  Connection.query('UPDATE users SET username = ?, user_pass = ?, email = ?, birth = ?, address = ?, no_phone = ? WHERE NIP = ?',
    [username, user_pass, email, birth, address, no_phone, NIP],
    (error, results) => {
        if (error) {
            res.status(500).json({error: 'Failed to update user.'});
            return;
        }
        res.status(200).json({message: 'Users updated succesfully.'});
    }); 
});


// Delete 
app.delete('/delete/:NIP', (req, res)=>{
    const NIP = req.params.NIP;
    Connection.query('DELETE FROM users WHERE NIP = ?', [NIP], (error, results)=>{
        if (error) {
            res.status(500).json({error: 'Failde to delete user.'});
            return;
        }
        res.status(200).json({message: 'User delete successfully.'});
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () =>{
    console.log('Server is running on port ${PORT}');
});