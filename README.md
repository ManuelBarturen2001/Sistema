# Sistema

# ejecutamos el comando: docker-compose up

# Abrimos otra terminal y ejecutamos este comando para ver si existe la base de datos:
# docker exec -it sistema-mysqldb-1 mysql -u barturen -p sistema
# luego ponemos la contraseña: barturen
# luego ponemos: 'SHOW DATABASES;' sin comillas simples y vereficamos que este la base de datos sistema
# luego ponemos: 'USE sistema';
# luego ponemos: 'SHOW TABLES'; si estan todas las tablas entonces corremos el programa

# Ahora si no existe la base de datos 'sistema' o el usuario barturen no existe o sale cualquier error ejecutamos todo lo siguiente:

# ----------------------------------------------- OPCIONAL ----------------------------------------------------------

# SI NO EXISTE EL USUARIO BARTUREN EJECUTAMOS:
# docker exec -it sistema-mysqldb-1 mysql -u root -p
# Ingresar la contraseña: barturen
# CREATE USER 'barturen'@'%' IDENTIFIED BY 'barturen';
# GRANT ALL PRILEGES ON sistema.* TO 'barturen'@'%';
# FLUSH PRIVILEGES;

# Luego de haber creado el usuario ejecutamos esto 
# SI NO EXISTE LA BASE DE DATOS 'sistema' EJECTUAMOS:

# docker cp "F:\JUAN\BackupDBProyectos\sistema.sql" sistema-mysqldb-1:/sistema.sql
# o tambien puede ser la ruta del mismo sistema por ejemplo docker cp "..\Sistema\sistema.sql" sistema-mysqldb-1:/sistema.sql

# docker exec -it sistema-mysqldb-1 mysql -u barturen -p sistema

# Luego ponemos la contraseña: barturen
#  y ejecutamos esto:

# source /sistema.sql

# y verificamos la base de datos con los primeros pasos
# Si esta todo correcto entonces corremos el programa