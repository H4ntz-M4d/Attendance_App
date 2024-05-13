const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const { use } = require('express/lib/application');
const res = require('express/lib/response');
const bcrypt = require('bcrypt');

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

app.post('/create', (req, res) => {
    const { NIP, username, user_pass, email, birth, address, no_phone } = req.body;

    // Generate salt
    bcrypt.genSalt(10, (err, salt) => {
        if (err) {
            res.status(500).json({ error: 'Failed to create user.' });
            return;
        }
        // Hash password with generated salt
        bcrypt.hash(user_pass, salt, (err, hashedPassword) => {
            if (err) {
                res.status(500).json({ error: 'Failed to create user.' });
                return;
            }
            // Insert user into database with hashed password
            Connection.query('INSERT INTO users(NIP, username, user_pass, email, birth, address, no_phone) VALUES (?, ?, ?, ?, ?, ?, ?)',
                [NIP, username, hashedPassword, email, birth, address, no_phone],
                (error, results) => {
                    if (error) {
                        res.status(500).json({ error: 'Failed to create user.' });
                        return;
                    }
                    res.status(201).json({ message: 'User created successfully.' });
                });
        });
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

// Login

app.post('/login', (req, res)=>{
    const {NIP, user_pass} = req.body;
    console.log('NIP:', NIP);
    console.log('user_pass', user_pass);


    Connection.query('SELECT * FROM users WHERE NIP = ?', [NIP], (error, results)=>{
        if (error) {
            console.error('Error execute query:', error);
            res.status(500).json({error : 'Failed to login.'});
            return;
        }

        console.log('Query result:', results);
        
        if (results.length === 0) {
            console.log('User not found.');
            res.status(401).json({error :'User not found.'});
            return;
        }
        

        const userData = results[0];

        bcrypt.compare(user_pass, userData.user_pass, (err, isMatch)=>{
            if (err) {
                console.error('Error comparing password:', err);
                res.status(500).json({error : 'Error comparing password.'});
                return;
            }

            if (isMatch) {
                console.log('Login sussessful');
                res.status(200).json({message: 'Login Succesful', user: userData});
            }else{
                console.log('Failed username or password.');
                res.status(401).json({error :'Failed username or password.'});
            }
        });
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

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
