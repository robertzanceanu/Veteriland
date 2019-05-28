const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
const oracledb = require('oracledb');

global.Idd="";

router.get('/:id', function (req, res) {
    //console.log(req.params.id);
    if(req._parsedOriginalUrl.pathname === '/stapan/doctori'){
                //console.log("IDDD");
                //console.log(Idd);
                res.redirect('/doctori/'+Idd);
                // req._parsedOriginalUrl.pathname = '/stapan/doctori'+req.params.id;
            }
    if(req._parsedOriginalUrl.pathname === '/stapan/addPacient'){
        res.redirect('/addPacient/' + Idd);
    }
    if(req._parsedOriginalUrl.pathname === '/stapan/addProgramare'){
        res.redirect('/addProgramare/' + Idd);
    }
    if(req._parsedOriginalUrl.pathname === '/stapan/stapan'){
        res.redirect('/stapan/' + Idd);
    }
    else{
    res.sendFile(path.join(__dirname + '/../view/html/stapan.html'));
    //console.log("id sus");
    //console.log(req.params.id);
    Idd=req.params.id;
    //console.log("sesiune");
    //console.log(req._parsedOriginalUrl.pathname);
    }
});
// router.route('/:id').get(function(req,res){
//     console.log("daaa");
//     if(req._parsedOriginalUrl.pathname === '/stapan/doctori'){
//         res.redirect('/doctori/'+req.params.id);
//     }
// })
// router.post('/:id',function(req,res){
//     console.log('aici!!!!');
//     console.log(req.body);
// })
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
                `select s.* from stapani s join stapaniuseri su on su.id_stapan=s.id join useri u on u.id=su.id_user where u.id=:id`,
                [id = userId],
                function (err, result) {
                    if (err) {
                        console.error(err.message);
                        doRelease(connection);
                    }
                    //console.log("am AJINS AICI");
                    //console.log(result.rows);
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
router.route('/pac/:id').get(function(req,res){
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
                `select * from table(allAnimals(:id))`,
                [id = userId],
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
                        name: result.rows[i][0],
                        age: result.rows[i][1],
                        type: result.rows[i][2]
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