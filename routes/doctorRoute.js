const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
module.exports = router.get('/:id', function (req, res) {
    res.sendFile(path.join(__dirname + '/../view/html/doctor.html'));
    console.log(req.params.id);
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