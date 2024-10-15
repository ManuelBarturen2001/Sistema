const jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs')
const conexion = require('../database/db');
const {promisify} = require('util');
const {error} = require('console');
//procedimiento para registrarnose

exports.auth = async (req,res)=>{
    const user = req.body.user;
    const pass = req.body.pass;
    let passwordHaash = await bcryptjs.hash(pass,8);
    if (user&&pass) {
        conexion.query('SELECT * FROM sistema.users WHERE user=?',[user], async(error,results)=>{

            if (error) {
                console.error('Database query error:', error);
                return res.status(500).json({ error: 'Internal server error' });
            }

            if (results.length == 0 || !(await bcryptjs.compare(pass, results[0].pass))) {
                res.render('login',{
                    alert: true,
                    alertTitle: "Error",
                    alertMessage: "Usuario y/o Password incorrectas",
                    alertIcon: 'error',
                    showConfirmButton: false,
                    timer: 1500,
                    ruta:'login'
                })
            }else{
                const id = results[0].id;
                const token = jwt.sign({id:id},process.env.JTW_SECRETO,{
                    expiresIn: process.env.JTW_TIEMPO_EXPIRA
                })
                //generamos el token sin fecha de expiracion
                //const token = jwt.sing({id:id},process.env.JWT_SECRETO)
                console.log(`TOKEN : ${token} para el usuario: ${user}`)
                //cookies
                const cookiesOptions = {
                    expires: new Date(Date.now()+process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000),
                    httpOnly: true
                }
                res.cookie('jwt', token, cookiesOptions)

                req.session.loggedin = true;
                req.session.name = results[0].name;
                return res.redirect('/admin');
                /*
                res.render('admin',{
                    alert: true,
                    alertTitle: "Conexión Exitosa",
                    alertMessage: "!Logeado Correctamente¡",
                    alertIcon: 'success',
                    showConfirmButton: false.toString(),
                    timer: 1500,
                    ruta:'admin'
                })*/
            }
        })
    }else{
        res.render('login',{
            alert: true,
            alertTitle: "Faltan Completar Datos",
            alertMessage: "Porfavor ingresa un usuario y/o contraseña",
            alertIcon: 'warning',
            showConfirmButton: false,
            timer: 1500,
            ruta:'login'
        })
    }
}

exports.register = async (req,res)=>{
    const user = req.body.user;
    const name = req.body.name;
    const rol = req.body.rol;
    const pass = req.body.pass;
    let passwordHaash = await bcryptjs.hash(pass,8);
    conexion.query('INSERT INTO sistema.users SET?',{user: user, name:name, rol:rol, pass:passwordHaash}, async(error,results)=>{
        if (error) {
            console.log(error);
        }else{
            res.render('register',{
                alert: true,
                alertTitle: "Registration",
                alertMessage: "¡Sucessful Registation!",
                alertIcon: 'success',
                showConfirmButton: false.toString(),
                timer: 1500,
                ruta:'login'
            })
            
        }
    });
}
/*
exports.isAuthenticated = async (req, rest, next)=>{
    if (req.cookies.jwt) {
        try {
            const decodificada = await promisify(jwt.verify)(req.cookies.jwt, process.env.JTW_SECRETO);
            conexion.query('SELECT * FROM users WHERE id = ?', [decodificada.id],(error,results)=>{
                if (!results) {
                    return next()
                }
                req.user = results[0];
                return next()
            })
        } catch (error) {
            console.log(error)
            return next()
        }
    }else{
        //res.redirect('/login');
    }
}

exports.logout = (req,rest) =>{
    res.clearCookie('jwt')
    return res.redirect('/login')
}
*/