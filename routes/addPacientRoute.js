const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
const passport = require('passport');

module.exports = router.get('/',function(req,res) {
    res.sendFile(path.join(__dirname+'/../view/html/addPacient.html'));
  });
/*
router.post('/', (req, res) => {
    var animalNume = req.body.animalNume;
    var tipAnimal = req.body.tipAnimal;
    var varstaAnimal = req.body.varstaAnimal;

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
                    adaugaONouaProgramare.asignarePacientDoctor(:animalNume, :tipAnimal, :varstaAnimal); 
                  END;`, {
                              animalNume: animalNume,
                              tipAnimal: tipAnimal,
                              varstaAnimal: varstaAnimal,
                          },  
                  { autoCommit: true },
                function(err, result) {
                    if (err) {
                      console.error(err.message);
                      return;
                    }
                    else {passport.authenticate('local', { successRedirect: '/addPacient',
                            failureRedirect: '/addPacient' });
                        res.redirect('/addPacient');
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
  );*/