const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
router.get('/:id', function (req, res) {
    res.sendFile(path.join(__dirname + '/../view/html/doctor.html'));
    console.log("id sus");
    console.log(req.params.id);
    
});
router.route('/json/:id').get(function(req,res){
    var userId = req.params.id;
    console.log("id-ul");
    console.log(req.params.id);
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
                    console.log("am AJINS AICI");
                    // console.log(result);
                    var rowData = {
                        id: result.rows[0][0],
                        lastName: result.rows[0][1],
                        firstName: result.rows[0][2],
                        age: result.rows[0][3],
                        email: result.rows[0][4],
                        phoneNumber: result.rows[0][5]
                    };
                    console.log(rowData);
                    console.log(result.rows[0][0]);
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
     console.log("mere");
     console.log(userId);
    connection = oracledb.getConnection({
        user: "student",
        password: "STUDENT",
        connectString: "localhost:1521/xe"
    },
        // console.log("Connected")
        function (err, connection) {
            connection.execute(
                `select p.nume,s.nume,s.email,p.varsta,p.tip_animal,pr.motiv,pr.data,pr.ora from pacienti p join pacient_stapan ps on p.id=ps.id_pacient join stapani s on ps.id_stapan=s.id join programari pr on pr.id_pacient = p.id where pr.id_doctor=:id`,
                [email = userId],
                function (err, result) {
                    if (err) {
                        console.error(err.message);
                        doRelease(connection);
                    }
                    console.log("am AJINS AICI");
                    console.log(result.rows.length); 
                    var rowData = {};
                    for(let i=0;i<result.rows.length;i++){
                    rowData[i] ={
                        pacientName: result.rows[i][0],
                        ownerName: result.rows[i][1],
                        ownerEmail: result.rows[i][2],
                        pacientAge: result.rows[i][3],
                        pacientType: result.rows[i][4],
                        reason: result.rows[i][5],
                        date: result.rows[i][6],
                        hour: result.rows[i][7]
                    }
                };
                    console.log(rowData);
                    console.log(result.rows[0][0]);
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