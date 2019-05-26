const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');
const passport = require('passport');
router.get('/', function (req, res) {
    res.sendFile(path.join(__dirname + '/../view/html/login.html'));
});
router.post('/', function (req, res) {
    console.log(req.body);
    console.log(req.body.email);
    var emailPost = req.body.email;
    var passwordPost = req.body.password;
    connection = oracledb.getConnection({
        user: "student",
        password: "STUDENT",
        connectString: "localhost:1521/xe"
    },
        // console.log("Connected")
        function (err, connection) {
            connection.execute(
                `select * from useri where email=:email and password=:password`,
                [email = emailPost, password = passwordPost],
                function (err, result) {
                    if (err) {
                        console.error(err.message);
                        doRelease(connection);
                    }
                    console.log("am AJINS AICI");
                    console.log(result.rows);
                    if (result.rows.length > 0) {
                        var rowData = {
                            id: result.rows[0][0],
                            email: result.rows[0][1],
                            password: result.rows[0][2],
                            doctor: result.rows[0][3],
                            stapan: result.rows[0][4]
                        };
                    }
                    console.log(rowData);
                    if(rowData.doctor==1){
                        passport.authenticate('local', { successRedirect: '/doctor',
                                   failureRedirect: '/login' });
                        res.redirect('/doctor/'+rowData.id);
                    }
                    else if(rowData.doctor==0){
                        passport.authenticate('local', { successRedirect: '/stapan',
                        failureRedirect: '/stapan' });
             res.redirect('/stapan/'+rowData.id);
                    }
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