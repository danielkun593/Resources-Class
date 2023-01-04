create database HOSPITAL on primary(
name=HOSPITAL_DATA,
filename='C:\bd_complexivo\hospital\HOSPITAL.mdf',
size=5mb,
maxsize=10mb,
filegrowth=10mb
) log on(
name=HOSPITAL_LOG,
filename='C:\bd_complexivo\hospital\HOSPITAL.ldf',
size=5mb,
maxsize=10mb,
filegrowth=10mb
)

use HOSPITAL;

alter authorization on database :: HOSPITAL to sa;

create table PACIENTE(
cod_paciente int primary key not null,
nombre_paciente varchar(50) not null,
apellidos_paciente varchar(50) not null,
sexo_paciente varchar(50) not null,
fecha_nacimiento_p date not null, --yyyy-mm-dd
dni_paciente varchar(50) not null,
direccion_paciente varchar(50) not null,
poblacion_paciente varchar(50) not null,
provincia_paciente varchar(50) not null,
telf_paciente varchar(50)
);

--alter table PACIENTE alter column dni_paciente varchar(50) not null;

create table MEDICO(
cod_medic int primary key not null,
nombre_medic varchar(50) not null,
apellido_medic varchar(50) not null,
departamento_medic varchar(50) not null,
direccion_medic varchar(50) not null,
telf_medic varchar(50) not null,
fecha_nacimiento_m date not null, --yyyy-mm-dd
dni_medico varchar(50) not null,
salario float not null
);

--alter table MEDICO alter column dni_medico varchar(50) not null;

create table VISITA(
num_visita int primary key not null,
fecha_visita date not null, --yyyy-mm-dd
cod_pacient int foreign key references PACIENTE(cod_paciente) not null,
cod_medico int foreign key references MEDICO(cod_medic) not null,
motivo_visita varchar(100) not null,
exploracion_visita varchar(50),
pruebas_realizadas varchar(50),
dia_diagnostico varchar(50) not null
);

--INSERTACION DE DATOS DE CADA UNA DE LAS TABLAS DE LA BASE DE DATOS HOSPITAL
--TABLA PACIENTE
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(1, 'Pepe', 'Lopez Garcia', 'Hombre', '1960-08-15', '50118654A', 'C/Bolivia 35', 'Las Rosas', 'Madrid', '916318765');
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(2, 'Ana', 'Garcia Fernandez', 'Mujer', '1956-05-21', '43256674X', 'C/Moreras 45', 'Majadahonda', 'Madrid', null);
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(3, 'Jose Luis', 'Rodriguez Buil', 'Hombre', '1968-02-24', '87548031B', 'C/Serrano 65', 'San Rafael', 'Segovia', '921171654');
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(4, 'Victor', 'Cristobal Perez', 'Hombre', '1970-06-06', '57843257T', 'C/Los Angeles 23', 'Toledo', 'Toledo', '925877899');
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(5, 'Carlos', 'Gonzales Anton', 'Hombre', '1982-06-19', '23585396G', 'C/Madrid 63', 'Getafe', 'Madrid', '912644763');
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(6, 'Fabiola', 'Jimenez Ortiz', 'Mujer', '1985-05-04', '96244734F', 'C/Antonio Lopez 75', 'Madrid', 'Madrid', '915473833');
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(7, 'Carmen', 'Martinez Rios', 'Mujer', '1952-04-07', '44729654H', 'C/Santa Engracia 49', 'Madrid', 'Madrid', '913527543');
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(8, 'Clara', 'Garcia Garcia', 'Mujer', '1975-12-13', '36729363J', 'C/Universidad 34', 'Leganes', 'Madrid', '914267344');
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(9, 'Lara', 'Barroso Mediavilla', 'Mujer', '1963-10-26', '65920643S', 'C/Roma 23', 'Segovia', 'Segovia', '921546878');
insert into PACIENTE(cod_paciente, nombre_paciente, apellidos_paciente, sexo_paciente, fecha_nacimiento_p, dni_paciente, direccion_paciente, poblacion_paciente, provincia_paciente, telf_paciente)
values(10, 'Antonio', 'Carrascal Andres', 'Hombre', '1972-09-18', '86454903L', 'C/Fernandez de los Rios', 'Pozuelo', 'Madrid', '913748489');


--TABLA MEDICOS
insert into MEDICO(cod_medic, nombre_medic, apellido_medic, departamento_medic, direccion_medic, telf_medic, fecha_nacimiento_m, dni_medico, salario)
values(1, 'Rosa', 'Gondalez Ochoa', 'Psiquiatria', 'C/Uruguay 34, Las Rosas(Madrid)', '916318567', '1967-07-14', '67654323B', 4500);
insert into MEDICO(cod_medic, nombre_medic, apellido_medic, departamento_medic, direccion_medic, telf_medic, fecha_nacimiento_m, dni_medico, salario)
values(2, 'Andres', 'Sebastian Benito', 'Neurologia', 'C/Anton Martin 64, Madrid', '917685354', '1958-09-21', '75642355G', 5000);
insert into MEDICO(cod_medic, nombre_medic, apellido_medic, departamento_medic, direccion_medic, telf_medic, fecha_nacimiento_m, dni_medico, salario)
values(3, 'Sandra', 'Ferreira Portal', 'Cardiologia', 'C/Julian Cortes 23, Majadahonda(Madrid)', '916348678', '1970-12-27', '43678789K', 4000);
insert into MEDICO(cod_medic, nombre_medic, apellido_medic, departamento_medic, direccion_medic, telf_medic, fecha_nacimiento_m, dni_medico, salario)
values(4, 'Alberto', 'Fernandez Ribero', 'Traumatologia', 'C/Ocaña 34, Madrid', '918756456', '1963-11-29', '35678745U', 5500);
insert into MEDICO(cod_medic, nombre_medic, apellido_medic, departamento_medic, direccion_medic, telf_medic, fecha_nacimiento_m, dni_medico, salario)
values(5, 'Carlos', 'Garcia Martinez', 'Medicina Familiar', 'C/Camarena 65, Madrid', '912368765', '1954-08-15', '56479763V', 4000);
insert into MEDICO(cod_medic, nombre_medic, apellido_medic, departamento_medic, direccion_medic, telf_medic, fecha_nacimiento_m, dni_medico, salario)
values(6, 'Maria', 'Fejio Rodriguez', 'Aparato Digestivo', 'C/San Silvestre 9, Madrid', '916546854', '1959-02-24', '56697599L', 4500);


--TABLA VISITAS
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(1, '2006-11-12', 1, 6, 'Dolor Estomago', null, null, 'Ulcera de estomago');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(2, '2006-11-23', 2, 3, 'Fuertes dolores de cabeza', null, null, 'Migrañas');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(3, '2006-11-30', 3, 2, 'Dolores en el pecho', null, null, 'Principio de infarto');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(4, '2006-12-15', 1, 6, 'Revision', null, null, 'Ligera mejoria ulcera');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(5, '2006-12-19', 4, 1, 'Depresion', null, null, 'Depresion');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(6, '2006-12-23', 5, 1, 'Depresion', null, null, 'Depresion');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(7, '2006-12-29', 2, 3, 'Revision', null, null, 'Normal');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(8, '2007-01-01', 3, 2, 'Revision', null, null, 'Normal');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(9, '2007-01-03', 1, 6, 'Revision', null, null, 'Normal');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(10, '2007-01-05', 6, 5, 'Fuertes sintomas de gripe', null, null, 'Neumonia');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(11, '2007-01-10', 7, 5, 'Sintomas de gripe', null, null, 'Gripe');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(12, '2007-01-15', 8, 4, 'Torcedora tobillo', null, null, 'Esguince tobillo derecho');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(13, '2007-01-20', 9, 4, 'Rotura humero', null, null, 'Rotura humero');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(14, '2007-01-22', 10, 2, 'Dolores en el pecho', null, null, 'Angina de pecho');
insert into VISITA(num_visita, fecha_visita, cod_pacient, cod_medico, motivo_visita, exploracion_visita, pruebas_realizadas, dia_diagnostico)
values(15, '2007-01-25', 5, 1, 'Revision', null, null, 'Depresion');


--CONSULTAS DEL LA BASE DE DATOS HOSPITAL
--CONSULTAS
select nombre_medic+' '+apellido_medic as NombreCompleto, (datepart(YEAR, getdate())-datepart(YEAR, fecha_nacimiento_m)) as Edad from MEDICO; -- (a
select * from PACIENTE where telf_paciente = NULL; --(b
select * from VISITA where DATEPART(MONTH, fecha_visita) = 12 and DATEPART(YEAR, fecha_visita) = 2006; --c
select p.nombre_paciente+' '+p.apellidos_paciente as Paciente, m.nombre_medic+' '+m.apellido_medic as Medico, v.motivo_visita as Motivo 
from PACIENTE as p, MEDICO as m, VISITA as v where v.cod_pacient = p.cod_paciente and v.cod_medico = m.cod_medic and v.motivo_visita = 'Revision';--(d
select COUNT(sexo_paciente) as Cantidad_pacientes_hombres from PACIENTE where sexo_paciente = 'Hombre'; --(e
select COUNT(sexo_paciente) as Cantidad_pacientes_mujeres from PACIENTE where sexo_paciente = 'Mujer'; --(f
update MEDICO set departamento_medic = 'Neurologia Pediatrica' where departamento_medic = 'Neurologia'; --(g
select salario from MEDICO;--(h
select COUNT(num_visita) as Num_visitias, cod_medico from VISITA group by cod_medico; --(i
select distinct motivo_visita, COUNT(num_visita) as Visitas from VISITA group by motivo_visita;--(j
select p.nombre_paciente+' '+p.apellidos_paciente as Pacientes, COUNT(num_visita) as Visitas from VISITA as v, PACIENTE as p
where (p.cod_paciente = v.cod_pacient) group by (p.nombre_paciente+' '+p.apellidos_paciente);  --(k



--daniel arce arce
--10sb - complexivo 
--base de datos