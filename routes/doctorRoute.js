const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
var dateFormat = require("dateformat");

router.get('/:id', function (req, res) {
    res.sendFile(path.join(__dirname + '/../view/html/doctor.html'));
    //console.log("id sus");
    //console.log(req.params.id);
    
});

router.route('/json/:id').get(function(req,res){
    var userId = req.params.id;
    //console.log("id-ul");
    //console.log(req.params.id);
    connection = oracledb.getConnection({
        user: "student",
        password: "STUDENT",
        connectString: "localhost:1521/xe"
    },
        // console.log("Connected")
        function (err, connection) {
            connection.execute(
                `select * from doctori where id=:id`,
                [email = userId],
                function (err, result) {
                    if (err) {
                        console.error(err.message);
                        doRelease(connection);
                    }
                    //console.log("am AJINS AICI");
                    // console.log(result);
                    var rowData = {
                        id: result.rows[0][0],
                        lastName: result.rows[0][1],
                        firstName: result.rows[0][2],
                        age: result.rows[0][3],
                        email: result.rows[0][4],
                        phoneNumber: result.rows[0][5]
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
router.route('/progr/:id').get(function(req,res){
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
                `select * from table(returneazaProgramariOre.afiseazaProgramariDoctor(:userId))`,
                [userId = userId],
                function (err, result) {
                    if (err) {
                        console.error(err.message);
                        doRelease(connection);
                    }
                    //console.log(result.rows);
                    //console.log("am AJINS AICI");
                    //console.log(result.rows.length); 
                    var rowData = {};
                    for(let i=0;i<result.rows.length;i++){
                    rowData[i] ={
                        pacientName: result.rows[i][0],
                        pacientAge: result.rows[i][1],
                        pacientType: result.rows[i][2],
                        date: dateFormat(result.rows[i][3],"dd-mm-yyyy"),
                        hour: result.rows[i][4],
                        reason: result.rows[i][5]
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
 })
module.exports=router;