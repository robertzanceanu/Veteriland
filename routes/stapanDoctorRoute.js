const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');

router.get('/:id',function(req,res){
    res.sendFile(path.join(__dirname + '/../view/html/doctori.html'));
    //console.log("id sus");
    console.log(req.params.id);
 });
 router.route('/doctori/:id').get(function(req,res){
    var userId = req.params.id;
    //  var userId = req.params.id.split("progr");
     //console.log("mere");
     //console.log(userId);
    connection = oracledb.getConnection({
        user: "student",
        password: "STUDENT",
        connectString: "localhost:1521/xe"
    },
        // console.log("Connected")
        function (err, connection) {
            connection.execute(
                `select * from table(findAnimaleDoctor)`,
                [],
                function (err, result) {
                    if (err) {
                        console.error(err.message);
                        doRelease(connection);
                    }
                    //console.log("am AJINS AICI");
                    //console.log(result.rows.length); 
                    var rowData = {};
                    for(let i=0;i<result.rows.length;i++){
                    rowData[i] ={
                        //id: result.rows[i][0],
                        lastName: result.rows[i][0],
                        firstName: result.rows[i][1],
                        typeAnimal: result.rows[i][2],
                        phoneNumber:result.rows[i][3]
                    }
                };
                    //console.log(rowData);
                    //console.log(result.rows[0][0]);
                    res.json(rowData);
                    doRelease(connection);
                }
            );
        }
    );
    function doRelease(connection) {
        connection.release(
            function (err) {
                if (err) {
                    console.error(err.message);
                }
            });
    }
 });
 
 module.exports = router;