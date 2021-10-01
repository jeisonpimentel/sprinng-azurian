# Notas

Este proyecto fue desarrollado con Java utilizando el framework spring boot, dentro de los archivos se encuentran dos para la creación de base de datos y población de tablas.

- Creacion_db.sql    (Utilizar este primero para la creación de la base de datos)
- script_azurian.sql (Utilizar para crear las tablas y población de los datos, son 03 tablas cliente, comunas y regiones)

En el application.properties se encuentra al configuración para la conexión a la base de datos, se utilizo postgres para desarrollar la prueba.
- Usuario: postgres
- Contraseña: 12345 (Esta puede ser cambiada en el application.properties en caso de que se tenga otra configurada).

En el pom.xml se encuentran todas la dependencias que se utilizaron en el proyecto.
Se utlizo para las consultas JPA/HIBERNATE.

Sin mas que agregar, estamos a la orden por cualquier consulta, si algo llegase a no funcionar. 
