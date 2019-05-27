const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
const passport = require('passport');

module.exports = router.get('/',function(req,res) {
    res.sendFile(path.join(__dirname+'/../view/html/addProgramare.html'));
  });

router.post('/', (req, res) => {
    var animalNume = req.body.animalNume;
    var tipAnimal = req.body.tipAnimal;
    var varstaAnimal = req.body.varstaAnimal;
    var numeDoctor = req.body.numeDoctor;
    var prenumeDoctor = req.body.prenumeDoctor;
    var dataDorita = req.body.dataDorita;
    var oraDorita = req.body.oraDorita;
    var motivConsultatie = req.body.motivConsultatie;

    var ora = oraDorita.substring(0,2);

    if(ora < "10" || ora > "17" || oraDorita.includes(':00')===false) {
      //res.writeHead(401,"numar", {"Content-Type": "text/plain"});
      //res.end();
      console.log("Numarul introdus nu este corect.");
    }
    else 
      {
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
                    adaugaONouaProgramare.asignarePacientDoctor(:animalNume, :tipAnimal, :varstaAnimal, :numeDoctor, :prenumeDoctor, :dataDorita, :oraDorita, :motivConsultatie); 
                  END;`, {
                              animalNume: animalNume,
                              tipAnimal: tipAnimal,
                              varstaAnimal: varstaAnimal,
                              numeDoctor: numeDoctor,
                              prenumeDoctor: prenumeDoctor,
                              dataDorita: dataDorita,
                              oraDorita: oraDorita,
                              motivConsultatie: motivConsultatie
                          },  
                  { autoCommit: true },
                function(err, result) {
                    if (err) {
                      console.error(err.message);
                      return;
                    }
                    else {passport.authenticate('local', { successRedirect: '/addProgramare',
                            failureRedirect: '/addProgramare' });
                        res.redirect('/addProgramare');
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