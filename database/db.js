const mysql = require('mysql');

//conexion con mysql
const conexion = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    port: process.env.DB_PORT
})

conexion.connect((error)=>{
    if (error) {
        console.error('El error de conexión es: '+error)
        return
    }
    console.log('¡Conectado a la base de datos!');
})

module.exports = conexion;