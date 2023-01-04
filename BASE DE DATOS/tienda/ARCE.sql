--creacion de base de datos con todos los parametros
create  database TIENDA on primary(
name=TIENDA_DATA,
filename='C:\bd_complexivo\tienda\TIENDA.mdf',
size=5mb,
maxsize=10mb,
filegrowth=10MB
)
log on(
name=TIENDA_LOG,
filename='C:\bd_complexivo\tienda\TIENDA.ldf',
size=5mb,
maxsize=10mb,
filegrowth=10MB
)--modo o modelo de cracion de base de datos

use TIENDA; --habilitacion de base de datos

--creacion de tablas
create table FABRICANTE(
id_fab int primary key not null,
nom_fab varchar(30) not null
);

create table ARTICULO(
id_art int primary key not null,
nom_art varchar(30) not null,
price float not null,
id_fab int foreign key references FABRICANTE(id_fab)
);

--habilitar autorizacion de la base para la creacion de diagrama entidad relacion
alter authorization on database :: TIENDA to sa;

--insercion de datos a las tablas creadas
insert into FABRICANTE(id_fab, nom_fab) values(1, 'Kingston');
insert into FABRICANTE(id_fab, nom_fab) values(2, 'Adata');
insert into FABRICANTE(id_fab, nom_fab) values(3, 'Logitech');
insert into FABRICANTE(id_fab, nom_fab) values(4, 'Lexar');
insert into FABRICANTE(id_fab, nom_fab) values(5, 'Seagate');

insert into ARTICULO values(1, 'Teclado', 100, 3);
insert into ARTICULO values(2, 'Disco Duro 30gb', 500, 5);
insert into ARTICULO values(3, 'Mouse', 80, 3);
insert into ARTICULO values(4, 'USB 1', 140, 4);
insert into ARTICULO values(5, 'RAM 16gb', 190, 1);
insert into ARTICULO values(6, 'Disco Extraible 250gb', 650, 5);
insert into ARTICULO values(7, 'USB 2', 279, 1);
insert into ARTICULO values(8, 'DVD', 450, 2);
insert into ARTICULO values(9, 'CD', 200, 2);
insert into ARTICULO values(10, 'Tarjeta de Red WiFi', 180, 3);


--realizacion de las consultas propuestas en el ejercicio Practica5_TIENDA_BD
select * from ARTICULO; --1 
select nom_art from ARTICULO;--2
select nom_art, price from ARTICULO;--3
select distinct nom_art from ARTICULO;--4
select * from ARTICULO where id_fab = 5;--5
select * from ARTICULO where nom_art ='Teclado';--6
select * from ARTICULO where nom_art ='USB 1' or nom_art ='USB 2' or nom_art = 'RAM 16gb';--7
select * from ARTICULO where nom_art like 'M%';--8
select nom_art from ARTICULO where price = 100;--9
select nom_art from ARTICULO where price > 200;--10
select * from ARTICULO where price > 100 and price < 350;--11
select AVG(price) from ARTICULO;--12
select AVG(price) from ARTICULO where id_fab = 2;--13
select nom_art, price from ARTICULO order by nom_art asc;--14
select * from ARTICULO order by price desc;--15
select nom_art, price from ARTICULO where price > 250 order by nom_art asc;--16
select a.id_art, a.nom_art, a.price, f.nom_fab from ARTICULO as a, FABRICANTE as f where a.id_fab = f.id_fab; --17
select a.id_art, a.nom_art, f.nom_fab from ARTICULO as a, FABRICANTE as f where a.id_fab = f.id_fab; --18
select a.nom_art, a.price, f.nom_fab from ARTICULO as a, FABRICANTE as f 
where a.id_fab = f.id_fab and f.nom_fab = 'Logitech' order by a.nom_art asc; --19
select a.nom_art, a.price, f.nom_fab from ARTICULO as a, FABRICANTE as f 
where a.id_fab = f.id_fab and (f.nom_fab = 'Lexar' or f.nom_fab = 'Kingston') order by a.price desc; --20
insert into ARTICULO values(11, 'Altavoces', 120, 2);--21
update ARTICULO set nom_art = 'Impresora laser' where id_art = 6;--22
alter table ARTICULO add descuento_art varchar(10) null;
update ARTICULO set descuento_art = 10;--23
update ARTICULO set descuento_art = 15 where price >= 300;--24
delete from ARTICULO where id_art = 6;--25
alter table FABRICANTE add categoria_fab varchar(10) null;
update FABRICANTE set categoria_fab = 1;
select * from FABRICANTE;--26
update FABRICANTE set categoria_fab = 2 where nom_fab = 'Adata'; --27


--Daniel Arce 10sB Complexivo
