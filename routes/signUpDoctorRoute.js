const router = require('express').Router();
const express = require('express');
const app = express();
const path = require('path');
module.exports = router.get('/',function(req,res) {
    res.sendFile(path.join(__dirname+'/../view/html/signUpDoctor.html'));
  });