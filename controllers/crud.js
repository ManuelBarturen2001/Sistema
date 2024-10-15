const conexion = require('../database/db');


/* CAPTURAMOS LOS DATOS POR CONSOLA
exports.save = (req,res)=>{
    const user = req.body.user;
    const rol = req.body.rol;
    console.log(user + "-" + rol);
}*/
exports.save = (req,res)=>{
    const user = req.body.user;
    const name = req.body.name;
    const rol = req.body.rol;
    const pass = req.body.pass;
    conexion.query('INSERT INTO sistema.users SET?',{user: user, name:name, rol:rol, pass:pass},(error,results)=>{
        if (error) {
            console.log(error);
        }else{
            res.redirect('/main');
        }
    });
}


exports.change = (req,res)=>{
    const id = req.body.id;
    const user = req.body.user;
    const name = req.body.name;
    const rol = req.body.rol;
    const pass = req.body.pass;
    conexion.query("UPDATE sistema.users SET user=?, name=?, rol=?, pass=? WHERE id=?", [user, name, rol, pass, id], (error, results) => {
        if (error) {
            console.log(error);
        } else {
            res.redirect('/main');
        }
    });
}
