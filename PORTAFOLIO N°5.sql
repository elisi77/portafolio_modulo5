--crear tablas
CREATE TABLE productos
(
    id integer NOT NULL,
    nombre_producto character varying(50),
    precio integer,
	existencias integer,
    PRIMARY KEY (id)
);

--tablas usuarios

CREATE TABLE usuarios
(
    rut character varying (4) ,
	contraseña character varying(20),
	nombre_cliente character varying(50),
	apellido_cliente character varying(50),
	email character varying(50),
    PRIMARY KEY (rut)
	
);

CREATE TABLE direccion_usuario
(
    id serial NOT NULL,
    direccion character varying(50),
	comuna character varying(50),
	ciudad character varying(50),
	region character varying(50),
	usuario_rut character varying (4),
    PRIMARY KEY (id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

CREATE TABLE carrito
(
    id serial NOT NULL,
	cantidad integer,
	producto_id integer,
	usuario_rut character varying(4),
    PRIMARY KEY (id),
	FOREIGN KEY (producto_id) REFERENCES productos(id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

CREATE TABLE metodo_pago
(
    id serial NOT NULL,
	metodo character varying(20),
	usuario_rut character varying(4),
    PRIMARY KEY (id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)
);

--tablas compra

CREATE TABLE detalle_pago
(
    id serial NOT NULL,
	estado character varying(12),
	metodo character varying(20),
    PRIMARY KEY (id)
);

CREATE TABLE compra
(
    id serial NOT NULL,
	usuario_rut character varying(4),
	fecha date,
	detallepago_id integer,
    PRIMARY KEY (id),
	FOREIGN KEY (detallepago_id) REFERENCES detalle_pago(id),
	FOREIGN KEY (usuario_rut) REFERENCES usuarios(rut)

);

CREATE TABLE detalle_compra
(
    id serial NOT NULL,
	producto_id integer,
	cantidad_compra integer,
	compra_id integer,
    PRIMARY KEY (id),
	FOREIGN KEY (producto_id) REFERENCES productos(id),
	FOREIGN KEY (compra_id) REFERENCES compra(id)
);

--datos por tabla

insert into productos values (1,'cocina',250000,9);
insert into productos values (2,'televisor',150000,15);
insert into productos values (3,'computador',400000,20);
insert into productos values (4,'tablet',50000,3);
insert into productos values (5,'celular',150000,8);
insert into productos values (6,'refrigerador',500000,12);
insert into productos values (7,'estufa',30000,30);
insert into productos values (8,'microondas',60000,13);
select*from productos;

insert into usuarios values ('11-1','mario11','mario','valenzuela','mario.valenzuela@gmail.com');
insert into usuarios values ('22-2','claudio22','claudio','rodriguez','claudio.rodriguez@gmail.com');
insert into usuarios values ('33-3','vicente33','vicente','veas','vicente.veas@gmail.com');
insert into usuarios values ('44-4','gloria44','gloria','carvajal','gloria.carvajal@gmail.com');
insert into usuarios values ('55-5','claudia55','claudia','muñoz','claudia.muñoz@gmail.com');
select*from usuarios;

insert into direccion_usuario values (default,'bremen 424','arica','arica','XV','11-1');
insert into direccion_usuario values (default,'diego portales 132','arica','arica','XV','22-2');
insert into direccion_usuario values (default,'santiago arata 341','arica','arica','XV','33-3');
insert into direccion_usuario values (default,'los limones 742','arica','arica','XV','44-4');
insert into direccion_usuario values (default,'belen 923','arica','arica','XV','55-5');
select*from direccion_usuario;

insert into carrito values (default,2,1,'11-1');
insert into carrito values (default,2,4,'22-2');
insert into carrito values (default,2,3,'33-3');
insert into carrito values (default,2,8,'44-4');
insert into carrito values (default,2,6,'55-5');
insert into carrito values (default,2,5,'22-2');
select*from carrito;

insert into metodo_pago values (default,'credito','11-1');
insert into metodo_pago values (default,'credito','22-2');
insert into metodo_pago values (default,'transferencia','33-3');
insert into metodo_pago values (default,'transferencia','44-4');
insert into metodo_pago values (default,'debito','55-5');
insert into metodo_pago values (default,'debito','55-5');
select*from metodo_pago;

insert into detalle_pago values (default,'finalizado','debito');
insert into detalle_pago values (default,'finalizado','credito');
insert into detalle_pago values (default,'finalizado','credito');
insert into detalle_pago values (default,'finalizado','credito');
insert into detalle_pago values (default,'finalizado','credito');
insert into detalle_pago values (default,'finalizado','transferencia');
insert into detalle_pago values (default,'finalizado','transferencia');
insert into detalle_pago values (default,'finalizado','debito');
insert into detalle_pago values (default,'finalizado','debito');
insert into detalle_pago values (default,'finalizado','debito');
select*from detalle_pago;

insert into compra values (default,'11-1','4-01-2023',1);
insert into compra values (default,'22-2','7-01-2023',2);
insert into compra values (default,'33-3','12-02-2023',3);
insert into compra values (default,'44-4','21-02-2023',4);
insert into compra values (default,'55-5','25-02-2023',5);
insert into compra values (default,'22-2','05-03-2023',6);
insert into compra values (default,'33-3','08-03-2023',7);
insert into compra values (default,'55-5','12-03-2023',8);
insert into compra values (default,'44-4','14-04-2023',9);
insert into compra values (default,'22-2','16-04-2023',10);
select*from compra;

insert into detalle_compra values (default,4,2,1);
insert into detalle_compra values (default,2,1,1);
insert into detalle_compra values (default,6,2,1);
insert into detalle_compra values (default,7,2,1);
insert into detalle_compra values (default,3,2,2);
insert into detalle_compra values (default,2,1,3);
insert into detalle_compra values (default,2,3,3);
insert into detalle_compra values (default,2,3,4);
insert into detalle_compra values (default,2,2,4);
insert into detalle_compra values (default,6,2,5);
insert into detalle_compra values (default,3,1,5);
insert into detalle_compra values (default,5,2,6);
insert into detalle_compra values (default,4,3,6);
insert into detalle_compra values (default,4,3,7);
insert into detalle_compra values (default,6,2,8);
insert into detalle_compra values (default,1,3,8);
insert into detalle_compra values (default,1,2,8);
insert into detalle_compra values (default,5,3,9);
insert into detalle_compra values (default,2,8,10);
insert into detalle_compra values (default,4,2,10);
select*from detalle_compra;

--actualizar precio de los productos, -20% por concepto de oferta de verano

update productos set precio=round(precio*0.8,0);

--listar todos los productos con stock critico (menor o igual a 5 unidades)

select nombre_producto, existencias 
from productos
where existencias<=5
order by existencias asc;

--simular la compra de al menos 3 productos, calcular subtotal, agregar IVA y mostrar total de la compra

insert into detalle_pago values (default,'finalizado','debito');
insert into compra values (default,'14-4','14-12-2022',(SELECT MAX(id) from detalle_pago));
insert into detalle_compra values (default,1,2,(SELECT MAX(id) from detalle_pago));
insert into detalle_compra values (default,5,3,(SELECT MAX(id) from detalle_pago));
insert into detalle_compra values (default,8,1,(SELECT MAX(id) from detalle_pago));

SELECT setval(pg_get_serial_sequence('compra', 'id'), coalesce(MAX(id), 1))
from compra;

--mostrar el total de ventas de enero de 2023
select  count(distinct compra_id) as numero_compras, round(sum((precio*cantidad_compra*1.19)),0) as Total
from detalle_compra 
inner join compra 
on compra.id=detalle_compra.compra_id
inner join productos
on productos.id=detalle_compra.producto_id
where (extract(month from fecha)=1) and (extract(year from fecha)=2023);

--listar comportamiento de compra del usuario que mas compras realizo durante el 2023

select usuario_rut as max_comprador
from( select usuario_rut,count(usuario_rut) as n_compras
	from compra
	group by usuario_rut
	order by n_compras desc
	limit 1) as tabla_calculada 