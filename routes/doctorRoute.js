const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
router.get('/:id', function (req, res) {
    res.sendFile(path.join(__dirname + '/../view/html/doctor.html'));
    console.log(req.params.id);
    
});
router.route('/json/:id').get(function(req,res){
    var userId = req.params.id;
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
                    console.log(result.rows);
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
module.exports=router;