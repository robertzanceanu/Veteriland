const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
const passport = require('passport');

router.get('/',function(req,res) {
    res.sendFile(path.join(__dirname+'/../view/html/signUpUser.html'));
  });

  router.post('/', (req, res) => {
    var prenumeStapan = req.body.firstName;
     var numeStapan = req.body.lastName;
     var varstaStapan = req.body.age;
     var emailStapan = req.body.email;
     var passwordStapan = req.body.password;
     var numar_telefonStapan = req.body.phoneNumber;
   
     if(numar_telefonStapan.length != 10 || numar_telefonStapan.includes('07')===false) {
       //res.writeHead(401,"numar", {"Content-Type": "text/plain"});
       //res.end();
       console.log("Numarul introdus nu este corect.");
     }
     else 
       if(emailStapan.includes('yahoo.ro')===false && emailStapan.includes('yahoo.com')===false && emailStapan.includes('gmail.com')===false && emailStapan.includes('info.uaic.ro')===false) {
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
                       insertStapani.insertIntoStapani(:prenumeStapan, :numeStapan, :varstaStapan, :emailStapan, :passwordStapan, :numar_telefonStapan); 
                   END;`, {
                               prenumeStapan: prenumeStapan,
                               numeStapan: numeStapan,
                               varstaStapan: varstaStapan,
                               emailStapan: emailStapan,
                               passwordStapan: passwordStapan,
                               numar_telefonStapan: numar_telefonStapan
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

   module.exports = router;