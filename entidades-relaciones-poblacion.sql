USE mistervet;
/*
	creacion entidades-tablas
*/

CREATE TABLE proveedor(
Rut_Proveedor VARCHAR(10) NOT NULL,
Nombre_Proveedor VARCHAR(45) NOT NULL,
Telefono_Proveedor VARCHAR(15) NOT NULL,
Email_Proveedor VARCHAR(45),
Direccion_Proveedor VARCHAR(45),
Paginaweb_Proveedor VARCHAR(45),
PRIMARY KEY(Rut_Proveedor)
);

CREATE TABLE Categoria(
Codigo_Categoria INT AUTO_INCREMENT,
Nombre_Categoria VARCHAR(45) NOT NULL,
PRIMARY KEY(Codigo_Categoria)
);

CREATE TABLE Unidad_Medida(
Codigo_Unidad_Medida INT AUTO_INCREMENT,
Nombre_Unidad_Medida VARCHAR(45) NOT NULL,
PRIMARY KEY(Codigo_Unidad_Medida)
);

CREATE TABLE productos(
Codigo_Producto VARCHAR(50),
Nombre_Producto VARCHAR(45) NOT NULL,
Descripcion_Producto VARCHAR(50),
Precio_Venta_Producto INT NOT NULL,
Codigo_Categoria INT NOT NULL,
Contenido_Producto INT NOT NULL,
Codigo_Unidad_Medida INT NOT NULL,
PRIMARY KEY(Codigo_Producto),
FOREIGN KEY(Codigo_Categoria) REFERENCES Categoria(Codigo_Categoria),
FOREIGN KEY(Codigo_Unidad_Medida) REFERENCES unidad_medida(Codigo_Unidad_Medida)
);

CREATE TABLE Recepcionista(
Rut_Recepcionista VARCHAR(10) NOT NULL,
Nombre_Recepcionista VARCHAR(45) NOT NULL,
Apellido_Recepcionista VARCHAR(45) NOT NULL,
Telefono_Recepcionista VARCHAR(45),
Email_Recepcionista VARCHAR(45),
Direccion_Recepcionista VARCHAR(45),
PRIMARY KEY(Rut_Recepcionista)
);

CREATE TABLE Cliente(
Rut_Cliente VARCHAR(10) NOT NULL,
Nombre_Cliente VARCHAR(45) NOT NULL,
Apellido_Cliente VARCHAR(45) NOT NULL,
Telefono_Cliente VARCHAR(45),
Email_Cliente VARCHAR(45),
Direccion_Cliente VARCHAR(45),
PRIMARY KEY(Rut_Cliente)
);

CREATE TABLE Servicio(
Codigo_Servicio INT AUTO_INCREMENT,
Nombre_Servicio VARCHAR(45) NOT NULL,
Descripcion_Servicio VARCHAR(80),
Valor_Servicio INT NOT NULL,
PRIMARY KEY(Codigo_Servicio)
);

CREATE TABLE Profesional(
Rut_Profesional VARCHAR(10) NOT NULL,
Nombre_Profesional VARCHAR(45) NOT NULL,
Apellido_Profesional VARCHAR(45) NOT NULL,
Telefono_profesional VARCHAR(45),
Email_Profesional VARCHAR(45),
Direccion_Profesional VARCHAR(45),
Especialidad_Profesional VARCHAR(45) NOT NULL,
PRIMARY KEY(Rut_Profesional)
);

CREATE TABLE Sexo(
Codigo_Sexo INT AUTO_INCREMENT,
Nombre_Sexo VARCHAR(20) NOT NULL,
primary key (Codigo_Sexo)
);

CREATE TABLE Especie(
Codigo_Especie INT AUTO_INCREMENT,
Nombre_Especie VARCHAR(20) NOT NULL,
primary key (Codigo_Especie)
);

CREATE TABLE Raza(
Codigo_Raza INT AUTO_INCREMENT,
Nombre_Raza VARCHAR(20) NOT NULL,
primary key (Codigo_Raza)
);

CREATE TABLE Mascota(
Codigo_Mascota INT AUTO_INCREMENT,
Rut_Cliente VARCHAR(10) NOT NULL,
Nombre VARCHAR(40) NOT NULL,
Codigo_Especie INT NOT NULL,
Codigo_Raza INT NOT NULL,
Codigo_Sexo INT NOT NULL,
Fecha_Nacimiento_Mascota DATE,
Tamaño_Mascota INT,
Peso_Mascota INT,
PRIMARY KEY(Codigo_Mascota),
FOREIGN KEY (Codigo_Especie) REFERENCES Especie(Codigo_Especie),
FOREIGN KEY (Codigo_Raza) REFERENCES Raza(Codigo_Raza),
FOREIGN KEY (Codigo_Sexo) REFERENCES Sexo(Codigo_Sexo)
);

CREATE TABLE Metodo_De_Pago(
Codigo_Metodo_De_Pago INT AUTO_INCREMENT,
Nombre_Metodo_De_Pago VARCHAR(20) NOT NULL,
primary key (Codigo_Metodo_De_Pago)
);

CREATE TABLE Tipo(
Codigo_Tipo INT AUTO_INCREMENT,
Nombre_Tipo VARCHAR(20) NOT NULL,
primary key (Codigo_Tipo)
);

CREATE TABLE Tamaño(
Codigo_Tamaño INT AUTO_INCREMENT,
Nombre_Tamaño VARCHAR(20) NOT NULL,
primary key (Codigo_Tamaño)
);

CREATE TABLE Jaula(
Numero_Jaula INT AUTO_INCREMENT,
Codigo_Tipo INT NOT NULL,
Codigo_Tamaño INT NOT NULL,
PRIMARY KEY(Numero_Jaula),
FOREIGN KEY(Codigo_Tipo) REFERENCES Tipo(Codigo_Tipo),
FOREIGN KEY(Codigo_Tamaño) REFERENCES Tamaño(Codigo_Tamaño)
);

CREATE TABLE Diagnostico(
Codigo_Diagnostico INT AUTO_INCREMENT,
Nombre_Diagnostico VARCHAR(50) NOT NULL,
PRIMARY KEY (Codigo_Diagnostico)
);

CREATE TABLE Historial(
Codigo_Historial INT AUTO_INCREMENT,
Nombre_Vacuna_Historial VARCHAR(50),
PRIMARY KEY (Codigo_Historial)
);

/*
	creacion relaciones
*/

USE mistervet;

CREATE TABLE Compra(
Codigo_Compra INT AUTO_INCREMENT,
Rut_Proveedor VARCHAR(10) NOT NULL,
Fecha Date NOT NULL,
Hora TIME NOT NULL,
PRIMARY KEY (Codigo_Compra),
FOREIGN KEY (Rut_Proveedor) REFERENCES Proveedor(Rut_Proveedor)
);

CREATE TABLE Registro_Compra(
Codigo_Registro_Compra INT AUTO_INCREMENT,
Codigo_Compra INT NOT NULL,
Codigo_Producto VARCHAR(50),
Cantidad_Registro_Compra INT NOT NULL,
Precio_Registro_Compra INT NOT NULL,
PRIMARY KEY (Codigo_Registro_Compra),
FOREIGN KEY (Codigo_Compra) REFERENCES Compra(Codigo_Compra),
FOREIGN KEY (Codigo_Producto) REFERENCES Productos(Codigo_Producto)
);

CREATE TABLE Vende(
Codigo_Vende INT AUTO_INCREMENT,
Rut_Recepcionista VARCHAR(10) NOT NULL,
Fecha Date NOT NULL,
Hora TIME NOT NULL,
PRIMARY KEY (Codigo_Vende),
FOREIGN KEY (Rut_Recepcionista) REFERENCES Recepcionista(Rut_Recepcionista)
);

CREATE TABLE Registro_Vende(
Codigo_Registro_Vende INT AUTO_INCREMENT,
Codigo_Vende INT NOT NULL,
Codigo_Producto VARCHAR(50),
Cantidad_Registro_Vende INT NOT NULL,
Precio_Registro_Vende INT NOT NULL,
Codigo_Metodo_De_Pago INT NOT NULL,
PRIMARY KEY (Codigo_Registro_Vende),
FOREIGN KEY (Codigo_Vende) REFERENCES Vende(Codigo_Vende),
FOREIGN KEY (Codigo_Producto) REFERENCES Productos(Codigo_Producto),
FOREIGN KEY (Codigo_Metodo_De_Pago) REFERENCES Metodo_De_Pago(Codigo_Metodo_De_Pago)
);

CREATE TABLE Recibe(
Codigo_Recibe INT AUTO_INCREMENT,
Rut_Cliente VARCHAR(10) NOT NULL,
Rut_Recepcionista VARCHAR(10) NOT NULL,
Fecha DATE NOT NULL,
Hora TIME NOT NULL,
PRIMARY KEY (Codigo_Recibe),
FOREIGN KEY (Rut_Cliente) REFERENCES Cliente(Rut_Cliente),
FOREIGN KEY (Rut_Recepcionista) REFERENCES Recepcionista(Rut_Recepcionista)
);

CREATE TABLE Solicita(
Codigo_Solicita INT AUTO_INCREMENT,
Codigo_Metodo_De_Pago INT NOT NULL,
Rut_Cliente VARCHAR(10) NOT NULL,
Codigo_Servicio INT NOT NULL,
Valor_Solicita INT NOT NULL,
Fecha DATE NOT NULL,
Hora TIME NOT NULL,
PRIMARY KEY (Codigo_Solicita),
FOREIGN KEY (Codigo_Metodo_De_Pago) REFERENCES Metodo_De_Pago(Codigo_Metodo_De_Pago),
FOREIGN KEY (Rut_Cliente) REFERENCES Cliente(Rut_Cliente),
FOREIGN KEY (Codigo_Servicio) REFERENCES Servicio(Codigo_Servicio)
);

CREATE TABLE Atiende(
Codigo_Atiende INT AUTO_INCREMENT,
Codigo_Servicio INT NOT NULL,
Rut_Profesional VARCHAR(10) NOT NULL,
Codigo_Mascota INT NOT NULL,
Codigo_Producto VARCHAR(50),
Codigo_Diagnostico INT,
Fecha DATE NOT NULL,
Hora TIME NOT NULL,
Dosis INT,
Codigo_Unidad_Medida INT,
PRIMARY KEY (Codigo_Atiende),
FOREIGN KEY (Codigo_Servicio) REFERENCES Servicio(Codigo_Servicio),
FOREIGN KEY (Rut_Profesional) REFERENCES Profesional(Rut_Profesional),
FOREIGN KEY (Codigo_Mascota) REFERENCES Mascota(Codigo_Mascota),
FOREIGN KEY (Codigo_Producto) REFERENCES Productos(Codigo_Producto),
FOREIGN KEY (Codigo_Diagnostico) REFERENCES Diagnostico(Codigo_Diagnostico),
FOREIGN KEY (Codigo_Unidad_Medida) REFERENCES Unidad_Medida(Codigo_Unidad_Medida)
);

CREATE TABLE Hospitaliza(
Codigo_Hospitaliza INT AUTO_INCREMENT,
Codigo_Mascota INT NOT NULL,
Numero_Jaula INT NOT NULL,
Fecha_Start_Jaula DATE NOT NULL,
Hora_Start_Jaula TIME NOT NULL,
Fecha_End_Jaula DATE,
Hora_End_Jaula TIME,
PRIMARY KEY (Codigo_Hospitaliza),
FOREIGN KEY (Codigo_Mascota) REFERENCES Mascota(Codigo_Mascota),
FOREIGN KEY (Numero_Jaula) REFERENCES Jaula(Numero_Jaula)
);

CREATE TABLE Tiene(
Codigo_Tiene INT AUTO_INCREMENT,
Codigo_Mascota INT NOT NULL,
Codigo_Historial INT NOT NULL,
Fecha_Historial DATE NOT NULL,
PRIMARY KEY (Codigo_Tiene),
FOREIGN KEY (Codigo_Mascota) REFERENCES Mascota(Codigo_Mascota),
FOREIGN KEY (Codigo_Historial) REFERENCES Historial(Codigo_Historial)
);


/*
	poblacion categoria
*/

USE mistervet;

INSERT INTO Categoria(Nombre_Categoria)
VALUES ('Anti-Parasitos');

INSERT INTO Categoria(Nombre_Categoria)
VALUES ('Alimento Perros');

INSERT INTO Categoria(Nombre_Categoria)
VALUES ('Alimento Gatos');

INSERT INTO Categoria(Nombre_Categoria)
VALUES ('Accesorios');

SELECT * FROM CATEGORIA;


/*
	poblacion unidad medida
*/

USE MISTERVET;

INSERT INTO Unidad_Medida(Nombre_Unidad_Medida)
VALUES ('ML');

INSERT INTO Unidad_Medida(Nombre_Unidad_Medida)
VALUES ('Unidad(es)');

INSERT INTO Unidad_Medida(Nombre_Unidad_Medida)
VALUES ('Kg');

INSERT INTO Unidad_Medida(Nombre_Unidad_Medida)
VALUES ('L');

SELECT * FROM Unidad_Medida;


/*
	poblacion proveedor
*/

USE MISTERVET;

INSERT INTO Proveedor(Rut_Proveedor,Nombre_Proveedor,Telefono_Proveedor,Email_Proveedor,Direccion_Proveedor,Paginaweb_Proveedor)
VALUES ('11111111-1','Salcobrand','+56911111111','aaa@a.aa', 'aaa #111','www.aaa.aa');

INSERT INTO Proveedor(Rut_Proveedor,Nombre_Proveedor,Telefono_Proveedor,Email_Proveedor,Direccion_Proveedor,Paginaweb_Proveedor)
VALUES ('11111111-2','Cruz Verde','+56911111112','aaa@b.bb', 'bbb #111','www.bbb.aa');

INSERT INTO Proveedor(Rut_Proveedor,Nombre_Proveedor,Telefono_Proveedor,Email_Proveedor,Direccion_Proveedor,Paginaweb_Proveedor)
VALUES ('11111111-3','Ahumada','+56911111113','aaa@c.cc', 'ccc #111','www.ccc.aa');

INSERT INTO Proveedor(Rut_Proveedor,Nombre_Proveedor,Telefono_Proveedor,Email_Proveedor,Direccion_Proveedor,Paginaweb_Proveedor)
VALUES ('11111111-4','Doctor Simi','+56911111114','aaa@d.dd', 'ddd #111','www.ddd.aa');

SELECT *FROM Proveedor;


/*
	poblacion productos
*/

USE MISTERVET;

INSERT INTO Productos(Codigo_Producto,Nombre_Producto,Descripcion_Producto,Precio_Venta_Producto,Codigo_Categoria,Contenido_Producto,Codigo_unidad_Medida)
VALUES ('1111','MasterDog','Alimento para Perros',20000,2,15,3);

INSERT INTO Productos(Codigo_Producto,Nombre_Producto,Descripcion_Producto,Precio_Venta_Producto,Codigo_Categoria,Contenido_Producto,Codigo_unidad_Medida)
VALUES ('2222','FrontLine','Anti Pulgas y Garrapatas para perros y gatos',14990,1,250,1);

INSERT INTO Productos(Codigo_Producto,Nombre_Producto,Descripcion_Producto,Precio_Venta_Producto,Codigo_Categoria,Contenido_Producto,Codigo_unidad_Medida)
VALUES ('3333','Arnes','Arnes para perro XL',14990,4,1,2);

INSERT INTO Productos(Codigo_Producto,Nombre_Producto,Descripcion_Producto,Precio_Venta_Producto,Codigo_Categoria,Contenido_Producto,Codigo_unidad_Medida)
VALUES ('4444','Purina Pro Plan','Alimento para Gatos',19990,3,5,3);

SELECT *FROM Productos;


/*
	poblacion recepcionista
*/

/* A DIFERENCIA DE LAS DEMAS TABLAS ACA SOLO TRABAJAN 2 RECEPCIONISTAS ASÍ QUE LOS INGRESÉ ALTIRO. */

USE MisterVet;

INSERT INTO Recepcionista(Rut_Recepcionista,Nombre_Recepcionista,Apellido_Recepcionista,Telefono_Recepcionista,Email_Recepcionista,Direccion_Recepcionista)
VALUES ('19551935-8','Rodrigo Humberto','Álvarez Abello','+56988052133','rodrigo.alvareza@utem.cl','Valle Lo Campino Villagarda #368');

INSERT INTO Recepcionista(Rut_Recepcionista,Nombre_Recepcionista,Apellido_Recepcionista,Email_Recepcionista,Direccion_Recepcionista)
VALUES ('18355866-8','Jennifer','Quiroz Pasten','Jen.quirozp@gmail.com','Lo campino sur #1555');

SELECT *FROM Recepcionista;


/*
	poblacion cliente
*/

USE MisterVet;

INSERT INTO Cliente(Rut_Cliente,Nombre_Cliente,Apellido_Cliente,Telefono_Cliente,Email_Cliente,Direccion_Cliente)
VALUES ('22222222-1','Alejandro','Alis','+56922222221','bbb@a.aa','aaa#222');

INSERT INTO Cliente(Rut_Cliente,Nombre_Cliente,Apellido_Cliente,Telefono_Cliente,Email_Cliente,Direccion_Cliente)
VALUES ('22222222-2','Beatriz','Brito','+56922222222','bbb@b.bb','bbb#222');

INSERT INTO Cliente(Rut_Cliente,Nombre_Cliente,Apellido_Cliente,Telefono_Cliente,Email_Cliente,Direccion_Cliente)
VALUES ('22222222-3','Cristian','Castro','+56922222223','bbb@c.cc','ccc#222');

INSERT INTO Cliente(Rut_Cliente,Nombre_Cliente,Apellido_Cliente,Telefono_Cliente,Email_Cliente,Direccion_Cliente)
VALUES ('22222222-4','Daniel','Davila','+56922222224','bbb@d.dd','ddd#222');

SELECT *FROM Cliente;


/*
	poblacion servicio
*/

USE MisterVet;

INSERT INTO Servicio(Nombre_Servicio,Descripcion_Servicio,Valor_Servicio)
VALUES ('Peluqueria','Corte de pelo',10000);

INSERT INTO Servicio(Nombre_Servicio,Descripcion_Servicio,Valor_Servicio)
VALUES ('Consulta','Consulta Medica',5000);

INSERT INTO Servicio(Nombre_Servicio,Descripcion_Servicio,Valor_Servicio)
VALUES ('Control','Control Medico',5000);

INSERT INTO Servicio(Nombre_Servicio,Descripcion_Servicio,Valor_Servicio)
VALUES ('Inyeccion Anti-Rabica Canina','Inyeccion Anti-Rabica Canina',5000);

INSERT INTO Servicio(Nombre_Servicio,Descripcion_Servicio,Valor_Servicio)
VALUES ('Inyeccion Triple Felina','Inyeccion Felina',5000);

SELECT *FROM Servicio;


/*
	poblacion profesional
*/

USE MISTERVET;

INSERT INTO Profesional(Rut_Profesional,Nombre_Profesional,Apellido_Profesional,Email_Profesional,Direccion_Profesional,Especialidad_Profesional)
VALUES ('15374319-3','Alicia', 'Ceballe Riquelme','Aliciaceballe@gmail.com','Lo Campino Sur #1555','Veterinaria');

INSERT INTO Profesional(Rut_Profesional,Nombre_Profesional,Apellido_Profesional,Email_Profesional,Direccion_Profesional,Especialidad_Profesional)
VALUES ('33333333-1','Ambar','Arancibia','ccc@aa.a','Lo campino sur #1555','Peluqueria');

SELECT *FROM Profesional;

/*
	poblacion especie
*/

USE MISTERVET;

INSERT INTO Especie(Nombre_Especie)
VALUES ('Canino');

INSERT INTO Especie(Nombre_Especie)
VALUES ('Felino');

INSERT INTO Especie(Nombre_Especie)
VALUES ('Reptil');
INSERT INTO Especie(Nombre_Especie)
VALUES ('Roedor');

SELECT *FROM Especie;


/*
	poblacion raza
*/
USE MisterVet;


INSERT INTO Raza(Nombre_Raza)
VALUES('Siames');

INSERT INTO Raza(Nombre_Raza)
VALUES('Labrador');

INSERT INTO Raza(Nombre_Raza)
VALUES('Bengala');

INSERT INTO Raza(Nombre_Raza)
VALUES('Pastor Aleman');

INSERT INTO Raza(Nombre_Raza)
VALUES('Otros');

SELECT *FROM Raza;




/*
	poblacion sexo
*/

USE MisterVet;

INSERT INTO Sexo(Nombre_Sexo)
VALUES ('Macho');

INSERT INTO Sexo(Nombre_Sexo)
VALUES ('Hembra');

INSERT INTO Sexo(Nombre_Sexo)
VALUES ('Indefinido');

SELECT *FROM Sexo;

/*
	poblacion diagnostico
*/

USE MisterVet;

INSERT INTO Diagnostico(Nombre_Diagnostico)
VALUES ('Distemper');

INSERT INTO Diagnostico(Nombre_Diagnostico)
VALUES ('Otitis');

INSERT INTO Diagnostico(Nombre_Diagnostico)
VALUES ('Sarna');

INSERT INTO Diagnostico(Nombre_Diagnostico)
VALUES ('Parasitos Internos');

SELECT *FROM Diagnostico;


/*
	poblacion mascota
*/

USE MisterVet;



INSERT INTO Mascota(Rut_Cliente,Nombre,Codigo_Especie,Codigo_Raza,Codigo_Sexo,Fecha_Nacimiento_Mascota,Tamaño_Mascota,Peso_Mascota)
VALUES ('22222222-1','Pelusa',1,2,2,'2010-01-01',80,30);

INSERT INTO Mascota(Rut_Cliente,Nombre,Codigo_Especie,Codigo_Raza,Codigo_Sexo,Fecha_Nacimiento_Mascota,Tamaño_Mascota,Peso_Mascota)
VALUES ('22222222-2','Sultan',2,1,1,'2015-08-01',20,8);

INSERT INTO Mascota(Rut_Cliente,Nombre,Codigo_Especie,Codigo_Raza,Codigo_Sexo,Fecha_Nacimiento_Mascota,Tamaño_Mascota,Peso_Mascota)
VALUES ('22222222-3','Rafael',3,4,1,'2016-08-05',40,8);


SELECT *FROM Mascota;


/*
	poblacion tipo
*/

USE MISTERVET;

INSERT INTO Tipo(Nombre_Tipo)
VALUES ('Canina y Felina');

INSERT INTO Tipo(Nombre_Tipo)
VALUES ('Roedor');

INSERT INTO Tipo(Nombre_Tipo)
VALUES ('Ave');

SELECT *FROM Tipo;


/*
	poblacion tamaño
*/

USE MISTERVET;

INSERT INTO Tamaño(Nombre_Tamaño)
VALUES ('91x57x63.5');

INSERT INTO Tamaño(Nombre_Tamaño)
VALUES ('80x30x50');

INSERT INTO Tamaño(Nombre_Tamaño)
VALUES ('15x15x15');

INSERT INTO Tamaño(Nombre_Tamaño)
VALUES ('20x10x5');

SELECT *FROM Tamaño;




/*
	poblacion jaula
*/


USE MisterVet;

INSERT INTO Jaula(Codigo_Tipo,Codigo_Tamaño)
VALUES(1,1);

INSERT INTO Jaula(Codigo_Tipo,Codigo_Tamaño)
VALUES(2,4);

INSERT INTO Jaula(Codigo_Tipo,Codigo_Tamaño)
VALUES(3,3);

INSERT INTO Jaula(Codigo_Tipo,Codigo_Tamaño)
VALUES(1,2);

SELECT *FROM Jaula;



/*
	poblacion historial
*/

USE MisterVet;

INSERT INTO Historial(Nombre_Vacuna_Historial)
VALUES ('Anti-Rabica');

INSERT INTO Historial(Nombre_Vacuna_Historial)
VALUES ('Octuple');

INSERT INTO Historial(Nombre_Vacuna_Historial)
VALUES ('Triple Felina');

SELECT *FROM Historial;



/*
	poblacion metodo_de_pago
*/


USE MisterVet;

INSERT INTO Metodo_De_Pago(Nombre_Metodo_De_Pago)
VALUES ('Red Compra');

INSERT INTO Metodo_De_Pago(Nombre_Metodo_De_Pago)
VALUES ('Debito');

INSERT INTO Metodo_De_Pago(Nombre_Metodo_De_Pago)
VALUES ('Credito');

INSERT INTO Metodo_De_Pago(Nombre_Metodo_De_Pago)
VALUES ('Efectivo');

SELECT *FROM Metodo_De_Pago;


/*
	poblacion compra
*/


USE MisterVet;

INSERT INTO Compra(Rut_Proveedor,Fecha,Hora)
VALUES('11111111-1','2020-05-17','09:56:00');

INSERT INTO Compra(Rut_Proveedor,Fecha,Hora)
VALUES('11111111-2','2020-05-16','09:56:00');

INSERT INTO Compra(Rut_Proveedor,Fecha,Hora)
VALUES('11111111-1','2020-04-17','09:56:00');

INSERT INTO Compra(Rut_Proveedor,Fecha,Hora)
VALUES('11111111-2','2020-04-16','09:56:00');

INSERT INTO Compra(Rut_Proveedor,Fecha,Hora)
VALUES('11111111-1','2019-05-17','09:56:00');

INSERT INTO Compra(Rut_Proveedor,Fecha,Hora)
VALUES('11111111-2','2019-05-16','09:56:00');

INSERT INTO Compra(Rut_Proveedor,Fecha,Hora)
VALUES('11111111-1','2019-04-17','09:56:00');

INSERT INTO Compra(Rut_Proveedor,Fecha,Hora)
VALUES('11111111-2','2019-04-16','09:56:00');

SELECT *FROM Compra;



/*
	poblacion registro_compra
*/

USE MisterVet;

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (3,3333,5,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (3,2222,10,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (4,4444,5,10000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (4,1111,5,10000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (5,3333,5,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (5,3333,5,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (6,2222,10,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (7,3333,5,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (7,2222,10,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (8,4444,5,10000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (8,1111,5,10000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (9,3333,5,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (9,3333,5,5000);

INSERT INTO Registro_Compra(Codigo_Compra,Codigo_Producto,Cantidad_Registro_Compra,Precio_Registro_Compra)
VALUES (10,2222,10,5000);

SELECT *FROM Registro_Compra;



/*
	poblacion vende
*/


USE MisterVet;

INSERT INTO Vende(Rut_Recepcionista,Fecha,Hora)
VALUES ('18355866-8','2020-02-17','10:20:00');

INSERT INTO Vende(Rut_Recepcionista,Fecha,Hora)
VALUES ('18355866-8','2020-02-17','11:20:00');

INSERT INTO Vende(Rut_Recepcionista,Fecha,Hora)
VALUES ('18355866-8','2020-02-17','12:20:00');

INSERT INTO Vende(Rut_Recepcionista,Fecha,Hora)
VALUES ('19551935-8','2019-02-17','10:20:00');

INSERT INTO Vende(Rut_Recepcionista,Fecha,Hora)
VALUES ('19551935-8','2019-02-17','11:20:00');

INSERT INTO Vende(Rut_Recepcionista,Fecha,Hora)
VALUES ('19551935-8','2019-05-17','10:20:00');

SELECT *FROM Vende;



/*
	poblacion registro_vende
*/


USE MisterVet;

INSERT INTO Registro_Vende(Codigo_Vende,Codigo_Producto,Cantidad_Registro_Vende,Precio_Registro_Vende,Codigo_Metodo_De_Pago)
VALUES (1,1111,3,20000,1);

INSERT INTO Registro_Vende(Codigo_Vende,Codigo_Producto,Cantidad_Registro_Vende,Precio_Registro_Vende,Codigo_Metodo_De_Pago)
VALUES (1,2222,3,14990,1);

INSERT INTO Registro_Vende(Codigo_Vende,Codigo_Producto,Cantidad_Registro_Vende,Precio_Registro_Vende,Codigo_Metodo_De_Pago)
VALUES (2,3333,1,14990,4);

INSERT INTO Registro_Vende(Codigo_Vende,Codigo_Producto,Cantidad_Registro_Vende,Precio_Registro_Vende,Codigo_Metodo_De_Pago)
VALUES (3,4444,2,19990,2);

INSERT INTO Registro_Vende(Codigo_Vende,Codigo_Producto,Cantidad_Registro_Vende,Precio_Registro_Vende,Codigo_Metodo_De_Pago)
VALUES (4,1111,1,20000,1);

INSERT INTO Registro_Vende(Codigo_Vende,Codigo_Producto,Cantidad_Registro_Vende,Precio_Registro_Vende,Codigo_Metodo_De_Pago)
VALUES (4,2222,3,14990,3);

INSERT INTO Registro_Vende(Codigo_Vende,Codigo_Producto,Cantidad_Registro_Vende,Precio_Registro_Vende,Codigo_Metodo_De_Pago)
VALUES (5,3333,1,14990,3);

INSERT INTO Registro_Vende(Codigo_Vende,Codigo_Producto,Cantidad_Registro_Vende,Precio_Registro_Vende,Codigo_Metodo_De_Pago)
VALUES (6,4444,2,19990,4);

SELECT *FROM Registro_Vende;



/*
	poblacion recibe
*/

USE MisterVet;

INSERT INTO Recibe(Rut_Cliente,Rut_Recepcionista,Fecha,Hora)
VALUES('22222222-1','18355866-8','2020-05-17','10:37');

INSERT INTO Recibe(Rut_Cliente,Rut_Recepcionista,Fecha,Hora)
VALUES('22222222-2','18355866-8','2020-05-17','11:37');

INSERT INTO Recibe(Rut_Cliente,Rut_Recepcionista,Fecha,Hora)
VALUES('22222222-3','19551935-8','2020-05-16','10:37');

INSERT INTO Recibe(Rut_Cliente,Rut_Recepcionista,Fecha,Hora)
VALUES('22222222-4','19551935-8','2020-05-16','11:37');

INSERT INTO Recibe(Rut_Cliente,Rut_Recepcionista,Fecha,Hora)
VALUES('22222222-1','19551935-8','2019-05-17','11:37');

INSERT INTO Recibe(Rut_Cliente,Rut_Recepcionista,Fecha,Hora)
VALUES('22222222-2','19551935-8','2019-04-17','11:37');

INSERT INTO Recibe(Rut_Cliente,Rut_Recepcionista,Fecha,Hora)
VALUES('22222222-3','19551935-8','2020-03-17','11:37');

SELECT *FROM Recibe;




/*
	poblacion solicita
*/

USE MisterVet;

INSERT INTO Solicita(Codigo_Metodo_De_Pago,Rut_Cliente,Codigo_Servicio,Valor_Solicita,Fecha,Hora)
VALUES(2,'22222222-1',1,10000,'2020-05-17','10:38:00');

INSERT INTO Solicita(Codigo_Metodo_De_Pago,Rut_Cliente,Codigo_Servicio,Valor_Solicita,Fecha,Hora)
VALUES(2,'22222222-2',2,5000,'2020-05-17','11:38:00');

INSERT INTO Solicita(Codigo_Metodo_De_Pago,Rut_Cliente,Codigo_Servicio,Valor_Solicita,Fecha,Hora)
VALUES(4,'22222222-3',3,5000,'2020-05-16','10:38');

INSERT INTO Solicita(Codigo_Metodo_De_Pago,Rut_Cliente,Codigo_Servicio,Valor_Solicita,Fecha,Hora)
VALUES(4,'22222222-4',1,10000,'2020-05-16','11:38');

SELECT *FROM Solicita;



/*
	poblacion atiende
*/

USE MISTERVET;


INSERT INTO Atiende(Codigo_Servicio,Rut_Profesional,Codigo_Mascota,Fecha,Hora)
VALUES(1,'33333333-1',1,'2020-05-17','10:38:00');

INSERT INTO Atiende(Codigo_Servicio,Rut_Profesional,Codigo_Mascota,Codigo_Diagnostico,Fecha,Hora)
VALUES(2,'15374319-3',2,4,'2020-05-17','11:38:00');

INSERT INTO Atiende(Codigo_Servicio,Rut_Profesional,Codigo_Mascota,Codigo_Diagnostico,Fecha,Hora)
VALUES(3,'15374319-3',11,1,'2020-05-16','10:38:00');

SELECT *FROM Atiende;




/*
	poblacion hospitaliza
*/


USE MisterVet;

INSERT INTO Hospitaliza(Codigo_Mascota,Numero_Jaula,Fecha_Start_Jaula,Hora_Start_Jaula,Fecha_End_Jaula,Hora_End_Jaula)
VALUES(1,1,'2020-02-05','12:16','2020-02-10','12:16');

INSERT INTO Hospitaliza(Codigo_Mascota,Numero_Jaula,Fecha_Start_Jaula,Hora_Start_Jaula)
VALUES(2,4,'2020-05-17','12:16');

SELECT *FROM Hospitaliza;



