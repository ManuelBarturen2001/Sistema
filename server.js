const express = require('express');
const app = express();
const cookieParser = require('cookie-parser');
const path = require('path');

app.set('views', path.join(__dirname, 'views'));

//motor de plantilla del servidor express 'ejs'
app.set('view engine', 'ejs');

//Le decimos como vamos a capturar los datos del formulario
app.use(express.urlencoded({extended:false}));
app.use(express.json());

//invocamos a dotenv
const dotenv = require('dotenv');
dotenv.config({path:'./env/.env'});

//invocamos a cookieparser
app.use(cookieParser());

//El directorio public
app.use('/resource', express.static('public'));
app.use('/resource', express.static(__dirname + '/public'));

//invocamos a bcryptjs
const bcryptjs = require('bcryptjs');

//sesiones
const session = require('express-session');
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: false
    
}));

//referencia a nuestro enrutador
app.use('/', require('./router'));

app.use(function (req, res, next) {
    if(!req.user)
    res.header('Cache-Control','private, no-cache, no-store, must-revalidate');
    next();
});

app.listen(4000, (req, res) => {
    console.log('Corriendo el servidor en localhost: 4000')
});