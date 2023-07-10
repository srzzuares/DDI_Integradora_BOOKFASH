CREATE DATABASE bookfash;
USE bookfash;

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(100),
    totallibro INT,
    biografiaAutor VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE Criterio (
    id_criterio INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcioncriterio VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE Editorial (
    id_editorial INT PRIMARY KEY,
    nombreeditorial VARCHAR(100),
    autoresEditorial VARCHAR(100),
    logoEditorial BLOB,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE Genero (
    id_genero INT PRIMARY KEY,
    nombreGenero VARCHAR(100),
    subGenero VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE Libro (
    id_libro INT PRIMARY KEY,
    titulolibro VARCHAR(100),
    portada BLOB,
    id_autor INT,
    id_criterio INT,
    id_editorial INT,
    id_genero INT,
    numeroPaginas INT,
    añoPublicacion INT,
    DescripcionLibro VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor),
    FOREIGN KEY (id_criterio) REFERENCES Criterio(id_criterio),
    FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial),
    FOREIGN KEY (id_genero) REFERENCES Genero(id_genero)
);

CREATE TABLE Persona (
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    edad INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE Recomendacion (
    id_recomendacion INT PRIMARY KEY,
    id_libro INT,
    id_persona INT,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    id_persona INT,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    contraseña VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

CREATE TABLE Valoracion (
    id_valoracion INT PRIMARY KEY,
    id_libro INT,
    id_persona INT,
    numeroEstrellas INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    estatus ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);
