create database FACTURA on primary(
name=FACTURA_DATA,
filename='C:\bd_complexivo\factura\FACTURA.mdf',
size=5mb,
maxsize=10mb,
filegrowth=10mb
)
log on(
name=FACTURA_LOG,
filename='C:\bd_complexivo\factura\FACTURA.ldf',
size=5mb,
maxsize=10mb,
filegrowth=10mb
)

use FACTURA;

create table PRODUCTO(
id_prod varchar(11) primary key not null,
name_prod varchar(50) not null,
price_prod float not null
);

create table CLIENTE(
id_client varchar(11) primary key not null,
name_client varchar(50) not null,
dir_client varchar(80) not null,
cod_postal varchar(5) not null,
poblacion_client varchar(25) not null,
provincia_client varchar(25) not null,
telf_client varchar(10) not null,
fax_client varchar(10) not null,
email varchar(25)
);

create table FACTURAS(
id_fact varchar(6) primary key not null,
id_cl varchar(11) foreign key references CLIENTE(id_client),
fecha_fact date not null,
desc_fact float not null,
iva_fact float not null,
);

create table DETALLE_FACTURA(
cod_details varchar(6) primary key not null,
id_factu varchar(6) foreign key references FACTURAS(id_fact),
id_product varchar(11) foreign key references PRODUCTO(id_prod),
cantidad_details int not null
);

alter authorization on database :: FACTURA to sa; 


--INSERTO DE DATOS EN LA TABLA CLIENTE
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('1', 'Candela Buendia Salinas', 'Avda. Constitucion 35', '30200', 'Yecla', 'Murcia', '0968682563', '968682564', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('2', 'Decomur S.L.', 'P. Ind. Oeste Nave 24', '30250', 'Jumilla', 'Murcia', '0968332232', '968332556', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('3', 'Julio Pastor Gómez', 'C/ Ramón Gaya, 34', '30360', 'Lorquí', 'Murcia', '0968523364', '968521100', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('4', 'construcciones López S.A.', 'P. I. La Capellanía, nave 20', '30600', 'Archena', 'Murcia', '0968523698', '968523699', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('5', 'Construcciones el Derribo, S.A:', 'Avda Tito Livio, 32', '30025', 'Murcia', 'Murcia', '0968254103', '968254105', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('6', 'Reformas Alcázar S.L:', 'Plaza Zocodover, 34', '40098', 'Toledo', 'Toledo', '0925336254', '925336554', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('7', 'Construcciones Hamman S.L:', 'C/ Julio Romero de Torres, 4B', '03692', 'Lucena', 'Córdoba', '0963253665', '963235223', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('8', 'Interiorismo Buonarotti S.L.', 'C/ Poeta Vicente Medina, 55', '52003', 'Villadiego', 'Salamanca', '0952369447', '952236541', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('9', 'Dorico’s S.A', 'C/ Toledo, Edif. Carlos V, 3H', '28036', 'Madrid', 'Madrid', '0913253669', '913252336', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('10', 'Pintura Rafael S.L.', 'C/ Camí de Fondo, Edif.. Neptuno 3C', '05236', 'Campello', 'Alicante', '0965332975', '965235291', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('11', 'Miguel Ramírez Candel', 'C/ Carmona, 12 ', '22036', 'Alora', 'Malaga', '0963253665', '963220336', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('12', 'Trazos decoradores S.A.', 'Avda Gran Vía Salzillo, 34 Edif. Aurora', '30025', 'Murcia', 'Murcia', '0968523665', '968445223', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('13', 'Olimpo Interiores S.A:', 'C/ Victoria Soler, 33', '22052', 'Cartama', 'Málaga', '0963253002', '963220114', null);
insert into CLIENTE(id_client, name_client, dir_client, cod_postal, poblacion_client, provincia_client, telf_client, fax_client, email)
values('14', 'Muebles Hidalgo S.A.', 'C/ Rosas, 33 ', '22036', 'Alora', 'Málaga', '0963256360', '963562300', null);

select * from CLIENTE;

--INSERTO DE DATOS EN LA TABLA PRODUCTO
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PPB-01', 'Pintura plastica blanca 1 Kg.', 3.30);
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PPB-02', 'Pintura plastica blanca 5 Kg.', 6.45);
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PPB-03', 'Pintura plastica blanca 10 Kg.', 11.30);
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PPA-01', 'Pintura plastica azul 5 Kg.', 8.65);
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PPA-02', 'Pintura plastica azul 10 Kg.', 15.40);
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PPM-01', 'Pintura plastica amarillo 5 Kg.', 10.45);
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PPM-02', 'Pintura plastica amarillo 10 Kg.', 19.40);
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PAB-01', 'Pintura acrilica blanca 1 Kg', 8.45);
insert into PRODUCTO(id_prod,name_prod, price_prod)
values('PAR-01', 'Pintura acrilica roja 1 Kg', 15.40);

select * from PRODUCTO;


--INSERTO DE DATOS EN LA TABLA FACTURA
insert into FACTURAS(id_fact, id_cl, fecha_fact, desc_fact, iva_fact)
values('001-07', '1', '2007-01-10', 0, 16);
insert into FACTURAS(id_fact, id_cl, fecha_fact, desc_fact, iva_fact)
values('002-07', '5', '2007-02-15', 5, 16);
insert into FACTURAS(id_fact, id_cl, fecha_fact, desc_fact, iva_fact)
values('003-07', '8', '2007-02-20', 15, 16);
insert into FACTURAS(id_fact, id_cl, fecha_fact, desc_fact, iva_fact)
values('004-07', '9', '2007-03-12', 20, 16);
insert into FACTURAS(id_fact, id_cl, fecha_fact, desc_fact, iva_fact)
values('005-07', '10', '2007-03-15', 20, 16);
insert into FACTURAS(id_fact, id_cl, fecha_fact, desc_fact, iva_fact)
values('006-07', '1', '2007-03-20', 10, 16);
insert into FACTURAS(id_fact, id_cl, fecha_fact, desc_fact, iva_fact)
values('007-07', '7', '2007-03-25', 5, 16);

select * from FACTURAS;


--INSERTO DE DATOS EN LA TABLA DETALLE-FACTURA
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('1', '001-07', 'PPB-01', 25);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('2', '001-07', 'PPB-02', 50);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('3', '001-07', 'PAB-01', 100);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('4', '001-07', 'PAR-01', 65);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('5', '002-07', 'PPB-02', 50);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('6', '002-07', 'PPA-02', 100);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('7', '002-07', 'PPM-02', 120);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('8', '003-07', 'PPB-01', 250);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('9', '003-07', 'PPB-02', 300);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('10', '003-07', 'PPA-01', 250);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('11', '003-07', 'PPA-02', 300);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('12', '004-07', 'PAR-01', 352);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('13', '005-07', 'PAR-01', 220);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('14', '005-07', 'PAB-01', 500);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('15', '006-07', 'PAB-01', 300);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('16', '006-07', 'PPB-01', 300);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('17', '006-07', 'PPA-02', 400);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('18', '007-07', 'PPB-01', 100);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('19', '007-07', 'PPB-02', 200);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('20', '007-07', 'PPA-01', 250);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('21', '007-07', 'PPA-02', 300);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('22', '007-07', 'PAB-01', 50);
insert into DETALLE_FACTURA(cod_details, id_factu, id_product, cantidad_details)
values('23', '007-07', 'PAR-01', 75);

select * from DETALLE_FACTURA;

select * from CLIENTE; --1
select * from CLIENTE where provincia_client = 'Murcia' or provincia_client = 'Madrid'; --2
select * from CLIENTE where poblacion_client = 'Alora'; --3
select * from CLIENTE where cod_postal >= 30000 and cod_postal <= 40000; --4
select * from PRODUCTO where price_prod > 10;--6
select distinct id_factu from DETALLE_FACTURA where cantidad_details > 50; --7
select distinct c.name_client from CLIENTE as c, DETALLE_FACTURA as df, FACTURAS as f where (f.id_cl = c.id_client and f.id_fact = df.id_factu) and df.id_product = 'PPA-01' or df.id_product = 'PPM-02';--8
select c.name_client, p.name_prod, f.desc_fact from CLIENTE as c, PRODUCTO as p, FACTURAS as f, DETALLE_FACTURA as df
where c.id_client=f.id_cl and f.id_fact=df.id_factu and p.id_prod=df.id_product and f.desc_fact=5;--9
delete from FACTURAS where fecha_fact='2007-02-15';--10
alter table PRODUCTO add estado_pro varchar(15); 
update PRODUCTO set estado_pro = 'ACTIVO';--11
select f.id_fact, df.cantidad_details, p.price_prod, f.desc_fact, ((p.price_prod*df.cantidad_details)*(f.desc_fact/100)) from DETALLE_FACTURA as df, PRODUCTO as p, FACTURAS as f where p.id_prod = df.id_product and f.id_fact=df.id_factu;--12 13
select SUM((p.price_prod*df.cantidad_details)*(f.desc_fact/100)) from DETALLE_FACTURA as df, PRODUCTO as p, FACTURAS as f where p.id_prod = df.id_product and f.id_fact=df.id_factu;--14
select f.id_fact, df.cantidad_details, p.price_prod, f.desc_fact, (p.price_prod*df.cantidad_details), ((p.price_prod*df.cantidad_details)*(f.desc_fact/100)), ((p.price_prod*df.cantidad_details)*(f.iva_fact/100)) from DETALLE_FACTURA as df, PRODUCTO as p, FACTURAS as f where p.id_prod = df.id_product and f.id_fact=df.id_factu;--15
select c.name_client, COUNT(f.id_fact) from FACTURAS as f, CLIENTE as c where c.id_client=f.id_cl; --16
