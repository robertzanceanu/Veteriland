const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
const passport = require('passport');

module.exports = router.get('/',function(req,res) {
    res.sendFile(path.join(__dirname+'/../view/html/signUpDoctor.html'));
  });

router.post('/', (req, res) => {
   var prenumeDoctor = req.body.firstName;
    var numeDoctor = req.body.lastName;
    var varstaDoctor = req.body.age;
    var emailDoctor = req.body.email;
    var passwordDoctor = req.body.password;
    var numar_telefonDoctor = req.body.phoneNumber;
  
    if(numar_telefonDoctor.length != 10 || numar_telefonDoctor.includes('07')===false) {
      //res.writeHead(401,"numar", {"Content-Type": "text/plain"});
      //res.end();
      console.log("Numarul introdus nu este corect.");
    }
    else 
      if(emailDoctor.includes('yahoo.ro')===false && emailDoctor.includes('yahoo.com')===false && emailDoctor.includes('gmail.com')===false && emailDoctor.includes('info.uaic.ro')===false) {
       // res.writeHead(401,"email gresit", {"Content-Type": "text/plain"});
        //res.end();
        console.log("Email-ul nu este valid.");
      }
      else {
        async function run()  {
          try {
              connection = await oracledb.getConnection(  {
                  user          : "STUDENT",
                  password      : "STUDENT",
                  connectString : "localhost:1521/xe"
                });
                console.log("Connected");
  
                connection.execute(
                  `BEGIN 
                      insertDoctori.insertIntoDoctori(:prenumeDoctor, :numeDoctor, :varstaDoctor, :emailDoctor, :passwordDoctor, :numar_telefonDoctor); 
                  END;`, {
                              prenumeDoctor: prenumeDoctor,
                              numeDoctor: numeDoctor,
                              varstaDoctor: varstaDoctor,
                              emailDoctor: emailDoctor,
                              passwordDoctor: passwordDoctor,
                              numar_telefonDoctor: numar_telefonDoctor
                          },  
                  { autoCommit: true },
                function(err, result) {
                    if (err) {
                      console.error(err.message);
                      return;
                    }
                    else {passport.authenticate('local', { successRedirect: '/login',
                            failureRedirect: '/login' });
                        res.redirect('/login');
                    }
                  });
  
              }
          catch(err) {
              console.log(err);
          }
        }
        run();  
        }
    //res.end()
  });