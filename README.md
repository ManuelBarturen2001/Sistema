# Sistema

# ejecutamos el comando: docker-compose up

# luego de que se copie importante ejecutar la siguiente linea y uno por uno, no todo junto:
# docker exec -it mysqldb mysql -u root -p
# Ingresar la contraseña: barturen
# CREATE USER 'barturen'@'%' IDENTIFIED BY 'barturen';
# GRANT ALL PRILEGES ON sistema.* TO 'barturen'@'%';
# FLUSH PRIVILEGES;

# Luego de haber creado el usuario ejecutamos esto 


# docker cp "F:\JUAN\BackupDBProyectos\sistema.sql" sistema-mysqldb-1:/sistema.sql
# o tambien puede ser la ruta del mismo sistema por ejemplo docker cp "..\Sistema\sistema.sql" sistema-mysqldb-1:/sistema.sql

# docker exec -it sistema-mysqldb-1 mysql -u barturen -p sistema

# Luego ponemos la contraseña: barturen
#  y ejecutamos esto:

# source /sistema.sql

# y accedemos al programa