const conexion = require('../database/db');

const multer = require('multer');
const upload = multer({dest: '/public/img/'});

// Middleware para la ruta '/new' que maneja la carga de imágenes


exports.newpersona = upload.single('imagen'), (req, res) => {
    const dni = req.body.dni;
    const nombre = req.body.nombre;
    const imagen = req.file.filename; // Obtener el nombre del archivo de la propiedad filename de req.file

    conexion.query('INSERT INTO sistema.personas SET ?', { dni: dni, nombre: nombre, imagen: req.file.originalname }, (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error interno del servidor');
        } else {
            console.log(req.file);
            saveImage(req.file);
            res.redirect('/crudpersonas');
        }
    });
};

exports.updateperson = upload.single('imagen'), (req,res)=>{
    const id = req.body.id;
    const dni = req.body.dni;
    const nombre = req.body.nombre;
    const imagen = req.file.filename;
    conexion.query("UPDATE sistema.personas SET dni=?, nombre=?, imagen=? WHERE id=?", [dni, nombre, imagen, id], (error, results) => {
        if (error) {
            console.log(error);
        } else {
            res.redirect('/crudpersonas');
        }
    });
}

function saveImage(file) {
    const newPath = `public/img/${file.originalname}`;
    fs.renameSync(file.path, newPath);
    return newPath;
}