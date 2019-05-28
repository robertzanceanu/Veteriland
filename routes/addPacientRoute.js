const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
const passport = require('passport');


router.get('/:id',function(req,res) {
    res.sendFile(path.join(__dirname+'/../view/html/addPacient.html'));
  });

router.post('/:id', function(req, res){
    var animalNume = req.body.animalNume;
    var tipAnimal = req.body.tipAnimal;
    var varstaAnimal = req.body.varstaAnimal;
    var userId = req.params.id;

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
                    adaugaAnimal.adaugaUnNouAnimal(:userId, :animalNume, :varstaAnimal, :tipAnimal);
                   END;`, {
                              userId: userId,
                              animalNume: animalNume,
                              varstaAnimal: varstaAnimal,
                              tipAnimal: tipAnimal
                          },  
                  { autoCommit: true },
                function(err, result) {
                    if (err) {
                      console.error(err.message);
                      return;
                    }
                    else {passport.authenticate('local', { successRedirect: '/addPacient/:userId',
                            failureRedirect: '/addPacient/:userId' });
                        res.redirect('/addPacient/:userId');
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
  );

  module.exports = router;