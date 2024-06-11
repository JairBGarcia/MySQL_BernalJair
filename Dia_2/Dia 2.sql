-- #####################
-- ### DIA # 2 - Comandos Generales ###
-- #####################

-- Comando general para revisión de bases de datos creadas
show databases;

-- Crear base de datos

create database dia2;

-- Utilizar BBDD dia2

use dia2;

-- Crear tabla departamento
create table departamento (
    id int auto_increment primary key,
    nombre varchar(50) not null
);

-- Crear tabla persona
create table persona(
    id int auto_increment primary key,
    nif varchar(9),
    nombre varchar(25) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar (50),
    ciudad varchar(25) not null,
    direccion varchar(50) not null,
    telefono varchar(9),
    fecha_nacimiento DATE not null,
    sexo enum('H','M') not null,
    tipo enum('profesor','alumno') not null
);

-- Crear la tabla de profesor
create table profesor(
    id_profesor int primary key,
    id_departamento int not null,
    foreign key (id_profesor) references persona(id),
    foreign key (id_departamento) references departamento(id)
);

create table asignatura(
    id int auto_increment primary key,
    nombre varchar(100) not null,
    creditos float not null,
    tipo enum ('Basica','Optativas', 'Obligatorias') not null,
    curso tinyint(3) not null,
    cuatrimestre TINYINT(3) not null,
    id_Profesor int,
    id_grado int,
    foreign key(id_profesor)references profesor(id_profesor),
    foreign key(id_grado)references grado(id)
);

create table grado(
	id int auto_increment primary key,
    nombre varchar(100) not null
);

create table alumno_se_matricula_asignatura(
    id_alumno int,
    id_asignatura int not null,
    id_curso_escolar int not null,
    foreign key (id_curso_escolar) references curso_escolar(id),
    foreign key (id_asignatura) references asignatura(id),
    foreign key(id_alumno) references persona(id)
);

create table curso_escolar(
	id int auto_increment primary key,
    anyo_inicio YEAR(4) not null,
    anyo_fin YEAR(4) not null
);

show tables;

-- Desarrollado por Jair Bernal / ID 1098607050
