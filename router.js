//ENRUTADOR PARA REDIRECCIONAR LAS PAGINAS
const express = require('express');
const router = express.Router();
const authController = require('./controllers/authController.js');
const crud = require('./controllers/crud.js');
const crudperson = require('./controllers/crudperson.js');
//Invocamos a la base de datos
const conexion = require('./database/db');

// ----------------------------------------------------------------------------------------------------
const multer = require('multer');
const upload = multer({ dest: '/public/img/' });
const fs = require('node:fs');

router.post('/images/single', upload.single('imagentest'), (req, res) => {
    console.log(req.file);
    saveImage(req.file);
    res.send('Termina');
});

// multiples imagenes
router.post('/images/multi', upload.array('photos', 5), (req, res) => {
    req.files.map(saveImage);
    res.send('Termina Multi');
})

function saveImage(file) {
    const newPath = `public/img/${file.originalname}`;
    fs.renameSync(file.path, newPath);
    return newPath;
}
// -----------------------------------------------------------------------------------------------------

//PERSONAS----------------------------------------------------------------------------------------------
const uploadperson = multer({ dest: '/public/img/person/' });
function saveImagePerson(file) {
    const newPath = `public/img/person/${file.originalname}`;
    fs.renameSync(file.path, newPath);
    return newPath;
}
router.get('/crudpersonas', (req, res) => {
    if (req.session.loggedin) {
        conexion.query('SELECT * FROM sistema.personas', (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render('crudpersonas', {
                    login: true,
                    personas: true,
                    name: req.session.name,
                    results: results
                });
            }
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});

router.get('/person/personview', (req, res) => {
    if (req.session.loggedin) {
        conexion.query('SELECT * FROM sistema.personas', (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render('person/personview', {
                    login: true,
                    personas: true,
                    name: req.session.name,
                    results: results
                });
            }
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});

router.get('/person/personadd', (req, res) => {
    if (req.session.loggedin) {
                res.render('person/personadd', {
                    login: true,
                    name: req.session.name,
                });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});

router.get('/person/personedit/:id', (req, res) => {
    const id = req.params.id;
    if (req.session.loggedin) {
        conexion.query('SELECT * FROM sistema.personas where id=?', [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render('person/personedit', {
                    login: true,
                    personas: results[0],
                    name: req.session.name,
                    results: results
                });
            }
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});

router.get('/eliminarperson/:id', (req, res) => {
    const id = req.params.id;
    conexion.query('DELETE FROM sistema.personas where id=?', [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.redirect('/person/personview');

        }
    });
});

router.post('/newperson', uploadperson.single('imagen'), (req, res) => {
    const dni = req.body.dni;
    const nombre = req.body.nombre;
    const imagen = req.file.filename; // Obtener el nombre del archivo de la propiedad filename de req.file

    conexion.query('INSERT INTO sistema.personas SET ?', { dni: dni, nombre: nombre, imagen: req.file.originalname }, (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error interno del servidor');
        } else {
            console.log(req.file);
            saveImagePerson(req.file);
            res.redirect('/person/personview');
        }
    });

});

router.post('/updateperson', uploadperson.single('imagen'), (req, res) => {
    const id = req.body.id;
    const dni = req.body.dni;
    const nombre = req.body.nombre;
    //const imagen = req.file.filename;
    

    if (req.file) {
        // Si se ha cargado una nueva imagen
        const imagen = req.file.originalname;

        conexion.query("UPDATE sistema.personas SET dni=?, nombre=?, imagen=? WHERE id=?", [dni, nombre, imagen, id], (error, results) => {
            if (error) {
                console.log(error);
                res.status(500).send('Error interno del servidor');
            } else {
                console.log(req.file);
                saveImagePerson(req.file);
                res.redirect('/person/personview');
            }
        });
    } else {
        // Si no se ha cargado una nueva imagen
        conexion.query("UPDATE sistema.personas SET dni=?, nombre=? WHERE id=?", [dni, nombre, id], (error, results) => {
            if (error) {
                console.log(error);
                res.status(500).send('Error interno del servidor');
            } else {
                res.redirect('/person/personview');
            }
        });
    }

});

//FIN PERSONAS----------------------------------------------------------------------------------

//PRODUCTOS -----------------------------------------------------------------------------------
const uploadproduct = multer({ dest: '/public/img/product/' });
function saveImageProduct(file) {
    const newPath = `public/img/product/${file.originalname}`;
    fs.renameSync(file.path, newPath);
    return newPath;
}
/* Guardar una imagen con un identificador 
function saveImageProduct(file) {
    const originalname = file.originalname;
    const dt = Date.now();
    const od = dt + originalname;
    const newPath = `public/img/product/${od}`;
    fs.renameSync(file.path, newPath);
    return newPath;
}
*/

router.get('/product/productview', (req, res) => {
    if (req.session.loggedin) {
        conexion.query('SELECT COUNT(*) AS total FROM sistema.productos', (errorCount, countResult) => {
            if (errorCount) {
                console.error('Error al contar productos:', errorCount);
                res.status(500).send('Error interno del servidor');
                return;
            }

            conexion.query(`SELECT * FROM sistema.productos`, (errorQuery, results) => {
                if (errorQuery) {
                    console.error('Error al encontrar productos:', errorQuery);
                    res.status(500).send('Error interno del servidor');
                    return;
                }

                conexion.query('SELECT * FROM sistema.categoria', (errorCategories, resultsc) => {
                    if (errorCategories) {
                        console.error('Error al encontrar categorias:', errorCategories);
                        res.status(500).send('Error interno del servidor');
                        return;
                    }

                    conexion.query('SELECT * FROM sistema.genero', (errorGenres, resultsg) => {
                        if (errorGenres) {
                            console.error('Error al encontrar genero:', errorGenres);
                            res.status(500).send('Error interno del servidor');
                            return;
                        }

                        res.render('product/productview', {
                            login: true,
                            productos: true,
                            name: req.session.name,
                            results: results,
                            resultsc: resultsc,
                            resultsg: resultsg,
                        });
                    });
                });
            });
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});

router.get('/product/productadd', (req, res) => {
    if (req.session.loggedin) {
        conexion.query('SELECT COUNT(*) AS total FROM sistema.productos', (errorCount, countResult) => {
            if (errorCount) {
                console.error('Error al contar productos:', errorCount);
                res.status(500).send('Error interno del servidor');
                return;
            }

            conexion.query(`SELECT * FROM sistema.productos`, (errorQuery, results) => {
                if (errorQuery) {
                    console.error('Error al encontrar productos:', errorQuery);
                    res.status(500).send('Error interno del servidor');
                    return;
                }

                conexion.query('SELECT * FROM sistema.categoria', (errorCategories, resultsc) => {
                    if (errorCategories) {
                        console.error('Error al encontrar categorias:', errorCategories);
                        res.status(500).send('Error interno del servidor');
                        return;
                    }

                    conexion.query('SELECT * FROM sistema.genero', (errorGenres, resultsg) => {
                        if (errorGenres) {
                            console.error('Error al encontrar genero:', errorGenres);
                            res.status(500).send('Error interno del servidor');
                            return;
                        }

                        res.render('product/productadd', {
                            login: true,
                            productos: true,
                            name: req.session.name,
                            results: results,
                            resultsc: resultsc,
                            resultsg: resultsg,
                        });
                    });
                });
            });
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});

router.get('/product/productedit/:id', (req, res) => {
    const id = req.params.id;
    if (req.session.loggedin) {
        conexion.query('SELECT * FROM sistema.productos where id=?', [id], (error, resultsp) => {
            if (error) {
                throw error;
            } else {
                conexion.query('SELECT * FROM sistema.tallasproduct where idproduct=?', [id], (error, resultst) => {
                    if (error) {
                        throw error;
                    } else {
                        conexion.query('SELECT * FROM sistema.imagenesproduct where idproduct=?', [id], (error, resultsi) => {
                            if (error) {
                                throw error;
                            } else {
                                res.render('product/productedit', {
                                    login: true,
                                    productos: resultsp[0],
                                    tallasproduct: resultst[0],
                                    imagenesproduct: resultsi[0],
                                    name: req.session.name,
                                    resultsp: resultsp,
                                    resultst: resultst,
                                    resultsi: resultsi
                                });
                            }
                        });
                    }
                });
            }
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});

router.get('/crudproduct', (req, res) => {
    if (req.session.loggedin) {
        conexion.query('SELECT COUNT(*) AS total FROM sistema.productos', (errorCount, countResult) => {
            if (errorCount) {
                console.error('Error al contar productos:', errorCount);
                res.status(500).send('Error interno del servidor');
                return;
            }

            conexion.query(`SELECT * FROM sistema.productos`, (errorQuery, results) => {
                if (errorQuery) {
                    console.error('Error al encontrar productos:', errorQuery);
                    res.status(500).send('Error interno del servidor');
                    return;
                }

                conexion.query('SELECT * FROM sistema.categoria', (errorCategories, resultsc) => {
                    if (errorCategories) {
                        console.error('Error al encontrar categorias:', errorCategories);
                        res.status(500).send('Error interno del servidor');
                        return;
                    }

                    conexion.query('SELECT * FROM sistema.genero', (errorGenres, resultsg) => {
                        if (errorGenres) {
                            console.error('Error al encontrar genero:', errorGenres);
                            res.status(500).send('Error interno del servidor');
                            return;
                        }

                        res.render('crudproduct', {
                            login: true,
                            productos: true,
                            name: req.session.name,
                            results: results,
                            resultsc: resultsc,
                            resultsg: resultsg,
                        });
                    });
                });
            });
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});


router.get('/product', (req, res) => {
    conexion.query('SELECT * FROM sistema.productos', (error, results) => {
        if (req.session.loggedin) {

            if (error) {
                throw error;
            } else {
                res.render('product', {
                    login: true,
                    productos: true,
                    name: req.session.name,
                    results: results
                });
            }

        } else {
            res.render('product', {
                login: false,
                productos: true,
                results: results
            });
        }
    });
});



/*
router.post('/newpersona', crudperson.newpersona);
router.post('/updateperson',crudpersonas.updateperson);
*/

/*
router.post('/newproduct', uploadproduct.single('imagen'), (req,res) =>{
    const nombre = req.body.nombre;
    const descripcion = req.body.descripcion;
    const precio = req.body.precio;
    const imagen = req.file.filename; // Obtener el nombre del archivo de la propiedad filename de req.file

    conexion.query('INSERT INTO sistema.productos SET ?', {nombre: nombre, descripcion: descripcion, precio:precio, imagen: req.file.originalname }, (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error interno del servidor');
        } else {
            console.log(req.file);
            saveImageProduct(req.file);
            res.redirect('/crudproduct');
        }
    });
});

const path = require('path');
function saveImageProduct(file, identifier) {
    const originalname = file.originalname;
    const ext = path.extname(originalname);
    const filename = identifier + '_' + Date.now() + '_' + originalname; // Crear un nuevo nombre de archivo con el identificador y una marca de tiempo
    const newPath = `public/img/product/${filename}`;
    fs.renameSync(file.path, newPath);
    return filename; // Devolver el nuevo nombre de archivo para que se pueda usar en la base de datos
}

router.post('/newproduct', uploadproduct.array('imagen', 5), (req, res) => {
    const nombre = req.body.nombre;
    const descripcion = req.body.descripcion;
    const precio = req.body.precio;
    const marca = req.body.marca;
    const color = req.body.color;
    const imagenes = req.files; // Obtener los archivos de imagen
    const primeraImagen = imagenes.length > 0 ? imagenes[0] : null;

    // Insertar en la tabla de productos
    conexion.query('INSERT INTO productos SET ?', { nombre, descripcion, precio, marca, color, imagen: primeraImagen }, (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error interno del servidor');
        } else {
            const productId = results.insertId; // Obtener el ID del producto insertado

            // Guardar la primera imagen en la tabla de productos y en el servidor con un identificador
            //const primeraImagen = imagenes.length > 0 ? saveImageProduct(imagenes[0], 'producto_principal_' + productId) : null;

            // Insertar en la tabla de imagenesproduct
            const imagenesInsertQuery = 'INSERT INTO imagenesproduct (idproduct, imagen1, imagen2, imagen3, imagen4, imagen5) VALUES (?, ?, ?, ?, ?, ?)';
            const imagenesParams = [productId];
            for (let i = 0; i < 5; i++) {
                if (imagenes[i]) {
                    // Obtener el nombre de la imagen con el identificador agregado
                    imagenesParams.push(saveImageProduct(imagenes[i], 'producto_' + productId));
                } else {
                    imagenesParams.push(null);
                }
            }
            conexion.query(imagenesInsertQuery, imagenesParams, (error, results) => {
                if (error) {
                    console.log(error);
                    res.status(500).send('Error interno del servidor');
                } else {
                    console.log('Imágenes insertadas correctamente');
                }
            });

            // Insertar en la tabla de tallasproduct
            const tallas = req.body;
            const tallasInsertQuery = 'INSERT INTO tallasproduct (idproduct, t39, t40, t41, t42) VALUES (?, ?, ?, ?, ?)';
            const tallasValues = [productId, tallas.t39 || 0, tallas.t40 || 0, tallas.t41 || 0, tallas.t42 || 0];
            conexion.query(tallasInsertQuery, tallasValues, (error, results) => {
                if (error) {
                    console.log(error);
                    res.status(500).send('Error interno del servidor');
                } else {
                    console.log('Tallas insertadas correctamente');
                    res.redirect('/crudproduct');
                }
            });
        }
    });
});
*/

router.post('/newproduct', uploadproduct.array('imagen', 9), (req, res) => {
    const nombre = req.body.nombre;
    const descripcion = req.body.descripcion;
    const slug = req.body.slug;
    const precio = req.body.precio;
    const marca = req.body.marca;
    const color = req.body.color;
    const genero = req.body.genero;
    const categoria = req.body.categoria;
    const imagenes = req.files.map(file => file.originalname); // Obtener los nombres de los archivos
    const primeraImagen = imagenes.length > 0 ? imagenes[0] : null;
    // Insertar en la tabla de productos
    conexion.query('INSERT INTO productos SET ?', { nombre, descripcion, slug, genero, categoria, precio, marca, color, imagen: primeraImagen }, (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error interno del servidor');
        } else {
            const productId = results.insertId; // Obtener el ID del producto insertado

            // Insertar en la tabla de imagenesproduct
            const imagenesInsertQuery = 'INSERT INTO imagenesproduct (idproduct, slugproduct, imagen1, imagen2, imagen3, imagen4, imagen5, imagen6, imagen7, imagen8, imagen9) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
            const numImagenes = imagenes.length;
            // Crear un array con las imágenes proporcionadas y rellenar con valores nulos si es necesario
            const imagenesCompletas = [...imagenes.slice(0, 9), ...Array.from({ length: Math.max(9 - numImagenes, 0) }).fill(null)];
            conexion.query(imagenesInsertQuery, [productId, slug, ...imagenesCompletas], (error, results) => {
                if (error) {
                    console.log(error);
                    res.status(500).send('Error interno del servidor');
                } else {
                    req.files.map(saveImageProduct);
                    console.log('Imágenes insertadas correctamente');
                }
            });

            // Insertar en la tabla de tallasproduct
            const tallas = req.body; // Supongamos que las tallas vienen en el cuerpo de la solicitud
            const tallasInsertQuery = 'INSERT INTO tallasproduct (idproduct, slugproduct, t39, t40, t41, t42, ts, tm, tl, txl) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
            const tallasValues = [productId, slug, tallas.t39 || 0, tallas.t40 || 0, tallas.t41 || 0, tallas.t42 || 0, tallas.ts || 0, tallas.tm || 0, tallas.tl || 0, tallas.txl || 0]; // Supongamos que las tallas están en el cuerpo de la solicitud
            conexion.query(tallasInsertQuery, tallasValues, (error, results) => {
                if (error) {
                    console.log(error);
                    res.status(500).send('Error interno del servidor');
                } else {
                    console.log('Tallas insertadas correctamente');
                    res.redirect('/product/productview');
                }
            });
        }
    });
});

router.post('/updateproduct', uploadproduct.array('imagen', 9), (req, res) => {
    const id = req.body.id;
    const nombre = req.body.nombre;
    const descripcion = req.body.descripcion;
    const slug = req.body.slug;
    const precio = req.body.precio;
    const marca = req.body.marca;
    const color = req.body.color;
    const genero = req.body.genero;
    const categoria = req.body.categoria;
    const imagenes = req.files.map(file => file.originalname); // Obtener los nombres de los archivos
    const primeraImagen = imagenes.length > 0 ? imagenes[0] : null;

    
    //UPDATE SIN NECESIDAD DE CARGAR LAS IMAGENES
    if (req.files.length > 0) {
        // Si se han cargado nuevas imágenes, actualizar todas las imágenes
        conexion.query('UPDATE sistema.productos SET nombre=?, descripcion=?, slug=?, genero=?, categoria=?, precio=?, marca=?, color=?, imagen=? WHERE id=?', [nombre, descripcion, slug, genero, categoria, precio, marca, color, primeraImagen, id ], (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error interno del servidor');
        } else {
            //const productId = results.insertId;  Obtener el ID del producto insertado

            
            const imagenesInsertQuery = 'UPDATE sistema.imagenesproduct SET slugproduct=?, imagen1=?, imagen2=?, imagen3=?, imagen4=?, imagen5=?, imagen6=?, imagen7=?, imagen8=?, imagen9=? WHERE idproduct=?';
            const numImagenes = imagenes.length;
            // Crear un array con las imágenes proporcionadas y rellenar con valores nulos si es necesario
            const imagenesCompletas = [...imagenes.slice(0, 9), ...Array.from({ length: Math.max(9 - numImagenes, 0) }).fill(null)];
            conexion.query(imagenesInsertQuery, [slug, ...imagenesCompletas, id], (error, results) => {
                if (error) {
                    console.log(error);
                    res.status(500).send('Error interno del servidor');
                } else {
                    req.files.map(saveImageProduct);
                    console.log('Imágenes actualizadas correctamente');
                }
            });
            
            // Insertar en la tabla de tallasproduct
            const tallas = req.body; // Supongamos que las tallas vienen en el cuerpo de la solicitud
            const tallasInsertQuery = 'UPDATE sistema.tallasproduct SET slugproduct=?, t39=?, t40=?, t41=?, t42=?, ts=?, tm=?, tl=?, txl=? WHERE idproduct=?';
            const tallasValues = [slug, tallas.t39 || 0, tallas.t40 || 0, tallas.t41 || 0, tallas.t42 || 0, tallas.ts || 0, tallas.tm || 0, tallas.tl || 0, tallas.txl || 0, id]; // Supongamos que las tallas están en el cuerpo de la solicitud
            conexion.query(tallasInsertQuery, tallasValues, (error, results) => {
                if (error) {
                    console.log(error);
                    res.status(500).send('Error interno del servidor');
                } else {
                    console.log('Tallas actualizadas correctamente');
                    res.redirect('/product/productview');
                }
            });
        }
    });
    }else{
        conexion.query('UPDATE sistema.productos SET nombre=?, descripcion=?, slug=?, genero=?, categoria=?, precio=?, marca=?, color=? WHERE id=?', [nombre, descripcion, slug, genero, categoria, precio, marca, color, id ], (error, results) => {
            if (error) {
                console.log(error);
                res.status(500).send('Error interno del servidor');
            } else {
                // Insertar en la tabla de tallasproduct
                const tallas = req.body; // Supongamos que las tallas vienen en el cuerpo de la solicitud
                const tallasInsertQuery = 'UPDATE sistema.tallasproduct SET slugproduct=?, t39=?, t40=?, t41=?, t42=?, ts=?, tm=?, tl=?, txl=? WHERE idproduct=?';
                const tallasValues = [slug, tallas.t39 || 0, tallas.t40 || 0, tallas.t41 || 0, tallas.t42 || 0, tallas.ts || 0, tallas.tm || 0, tallas.tl || 0, tallas.txl || 0, id]; // Supongamos que las tallas están en el cuerpo de la solicitud
                conexion.query(tallasInsertQuery, tallasValues, (error, results) => {
                    if (error) {
                        console.log(error);
                        res.status(500).send('Error interno del servidor');
                    } else {
                        console.log('Tallas actualizadas correctamente');
                        res.redirect('/product/productview');
                    }
                });
            }
        });
    }

    // Insertar en la tabla de productos 

    
    
});

router.get('/eliminarproduct/:id', (req, res) => {
    const id = req.params.id;
    conexion.query('DELETE FROM sistema.productos where id=?', [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            console.log('Producto eliminado con exito');
            conexion.query('DELETE FROM sistema.imagenesproduct where idproduct=?', [id], (error, results) => {
                if (error) {
                    throw error;
                } else {
                    console.log('Las Imagenes del producto han sido eliminadas con exito');
                    conexion.query('DELETE FROM sistema.tallasproduct where idproduct=?', [id], (error, results) => {
                        if (error) {
                            throw error;
                        } else {
                            console.log('Las Tallas del producto se han eliminado con exito');
                            res.redirect('/product/productview');
                        }
                    });
                }
            });

        }
    });
});


//FIN PRODUCTOS -------------------------------------------------------------------------------

//Peticion de todos los registros de los usuarios
router.get('/main', (req, res) => {

    if (req.session.loggedin) {
        conexion.query('SELECT * FROM users', (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render('main.ejs', {
                    login: true,
                    name: req.session.name,
                    results: results
                });
            }
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }


});

router.get('/admin', (req, res) => {
    if (req.session.loggedin) {
        conexion.query('SELECT * FROM sistema.personas', (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render('admin', {
                    login: true,
                    personas: true,
                    name: req.session.name,
                    results: results
                });
            }
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }
});

router.get('/login', (req, res) => {
    res.render('login.ejs');
});

router.get('/', (req, res) => {
    if (req.session.loggedin) {
        res.render('index', {
            login: true,
            name: req.session.name,
            // para pedir el usuario - user: req.user
        });
    } else {
        res.render('index', {
            login: false,
            name: 'Debe iniciar sesión'
        });
    }

});

router.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            console.error('Error al cerrar la sesión:', err);
            return res.status(500).send('Error al cerrar la sesión');
        }
        // Eliminar la cookie de sesión

        res.clearCookie('connect.sid');
        res.clearCookie('jwt');
        // Redirigir al usuario a la página de inicio de sesión u otra página relevante
        return res.redirect('/login');
    });
});

router.get('/register', (req, res) => {
    res.render('register.ejs');
});

router.get('/create', (req, res) => {
    res.render('create.ejs');
});

router.get('/edit/:id', (req, res) => {
    const id = req.params.id;
    conexion.query('SELECT * FROM users where id=?', [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('edit.ejs', { user: results[0] });
        }
    });
});

router.get('/delete/:id', (req, res) => {
    const id = req.params.id;
    conexion.query('DELETE FROM users where id=?', [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.redirect('/main');
        }
    });
});

//invocamos al crud
router.post('/save', crud.save);
router.post('/change', crud.change);

//invocamos al authController
router.post('/auth', authController.auth);
router.post('/register', authController.register);

//Exportamos
module.exports = router;



