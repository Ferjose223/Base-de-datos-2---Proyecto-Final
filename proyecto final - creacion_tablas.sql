



CREATE TABLE provincia (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR(100),
	estado boolean
);


CREATE TABLE distrito(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_provincia INT,
	nombre VARCHAR (100),
	estado BOOLEAN,
	FOREIGN KEY (id_provincia) REFERENCES provincia(id)
)

CREATE TABLE localidad (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_distrito INT,
	corregimiento VARCHAR (100),
	estado BOOLEAN,
	FOREIGN KEY (id_distrito) REFERENCES distrito(id)
)

CREATE TABLE Tipo_Identificacion (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (100),
	estado BOOLEAN
)


CREATE TABLE dentista (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (100),
	apellido VARCHAR (100),
	cedula VARCHAR (100),
	id_tipo_identificacion INT,
	direccion VARCHAR (100),
	id_localidad INT,
	correo_electronico VARCHAR (100),
	telefono VARCHAR (100),
	genero ENUM ("Masculino","Femenino"),
	fecha_nacimiento DATE,
	fecha_ingreso DATE,
	estado BOOLEAN,
	FOREIGN KEY (id_tipo_identificacion) REFERENCES Tipo_Identificacion(id),
	FOREIGN KEY (id_localidad) REFERENCES localidad(id)
)


CREATE TABLE especialidades (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (100),
	descripcion VARCHAR (500),
	estado BOOLEAN
)


CREATE TABLE dentista_especialidad (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_dentista INT,
	id_especialidad INT,
	estado BOOLEAN,
	FOREIGN KEY (id_dentista) REFERENCES dentista(id),
	FOREIGN KEY (id_especialidad) REFERENCES especialidades(id)
)

CREATE TABLE agenda (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_dentista INT,
	fecha DATE,
	hora TIME,
	estado BOOLEAN,
	FOREIGN KEY (id_dentista) REFERENCES dentista(id)
)


CREATE TABLE complicades (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (100),
	estado BOOLEAN
)




CREATE TABLE paciente (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (100),
	apellido VARCHAR (100),
	cedula VARCHAR (100),
	id_tipo_identificacion INT,
	direccion VARCHAR (100),
	id_localidad INT,
	correo_electronico VARCHAR (100),
	telefono VARCHAR (100),
	genero ENUM ("Masculino","Femenino"),
	fecha_nacimiento DATE,
	id_complicadez INT,
	estado BOOLEAN,
	FOREIGN KEY (id_tipo_identificacion) REFERENCES Tipo_Identificacion(id),
	FOREIGN KEY (id_localidad) REFERENCES localidad(id),
	FOREIGN KEY (id_complicadez) REFERENCES complicadez(id)
)

CREATE TABLE historial (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_paciente INT,
	fecha DATE,
	hora TIME,
	estado BOOLEAN,
	FOREIGN KEY (id_paciente) REFERENCES paciente(id)
)

CREATE TABLE odontograma (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_paciente INT,
	num_diente INT,
	estado BOOLEAN,
	FOREIGN KEY (id_paciente) REFERENCES paciente(id)
)

CREATE TABLE tratamiento (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (100),
	descripcion VARCHAR (500),
	costo int,
	estado BOOLEAN
)

CREATE TABLE metodo_pago (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR (100),
	estado boolean
)

CREATE TABLE factura (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_paciente INT,
	id_tratamiento INT,
	abono INT,	
	id_metodo_pago INT,
	fecha_pago DATE,
	estado BOOLEAN,
	FOREIGN KEY (id_paciente) REFERENCES paciente(id),
	FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id),
	FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id)
)

CREATE TABLE cita (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_paciente INT,
	id_agenda INT,
	id_tratamiento INT,
	observaciones VARCHAR(100),
	estado BOOLEAN,
	
	FOREIGN KEY (id_paciente) REFERENCES paciente(id),
	FOREIGN KEY (id_agenda) REFERENCES agenda(id),
	FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id)
	
)













T