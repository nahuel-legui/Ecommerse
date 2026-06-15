use master
go

create database Ecomerce_db
go

use Ecomerce_db
go

create table Clientes(
dni_Cl char(8) not null ,
nombre_Cl varchar(20) not null,
apellido_Cl varchar(20)not null,
direccion_Cl varchar(50) not null,
fotoPerfil_Cl varchar(500) not null,
localidad_Cl varchar(50)not null,
fechaNacimiento_Cl date not null,
correoElectronicp_Cl varchar(70)not null,
contrasenia_Cl varchar(12)not null,
admin_Cl bit default 0 not null,
activo_Cl bit default 1 not null,
constraint pkCliente primary key (dni_Cl)
)
go

create table Ventas(
idVenta_Vn int identity(1,1) not null,
dni_Cl_Vn char(8) not null, 
total_Vn decimal(8,2) not null default 0, 
fechaVenta_Vn date default getDate() not null ,
constraint pkVentas primary key (idVenta_Vn),
constraint fkClientes_Ventas foreign key(dni_Cl_Vn) references Clientes (dni_Cl)
)
go

create table Categoria(
idCategoria_Ct int identity(1,1) not null,
descripcion_Ct varchar(50) not null,
constraint pkCategoria primary Key(idCategoria_Ct)
)
go


create table Productos(
idProducto_Pd int identity (1,1) not null,
nombreProducto_Pd varchar(30) not null,
precioUnitario_Pd decimal (8,2) not null,
stock_Pd int not null,
descripcion_Pd varchar(300) not null, 
ImagenUrl_Pd varchar(500) not null, 
idCategoria_Pd_Ct int not null,
activo_Pd bit default 1 not null,
constraint pkProductos primary key(idProducto_Pd),
constraint fkProducto_Categoria foreign key(idCategoria_Pd_Ct) references Categoria(idCategoria_Ct)
)
go

create table DetalleVenta(
idProducto_Pd_Dv int not null,
idVentas_Vn_Dv int not null, 
cantidad_Dv int not null, 
precioUnitario_Dv decimal(8,2)not null,
constraint pkDetalleVenta primary key(idProducto_Pd_Dv,idVentas_Vn_Dv),
constraint fkProducto_DetalleVenta foreign key (idProducto_Pd_Dv) references Productos(idProducto_Pd),
constraint fkVentaas_DetalleVenta foreign key (idVentas_Vn_Dv) references Ventas (idVenta_Vn)
)
go

create table seguimiento(
idSeguimiento_Sg int identity(1,1) not null,
idVenta_Vn_Sg int not null,
enCamino_Sg bit not null,
entregado_Sg bit not null,
constraint pkSeguimiento primary key (idSeguimiento_Sg),
constraint fkVenta_Seguimiento foreign key (idVenta_Vn_Sg) references Ventas (idVenta_Vn)
)
go



-- 1. INSERTAR CATEGORIAS
insert into Categoria (descripcion_Ct) values 
('Electrónica'),
('Ropa y Calzado'),
('Hogar y Cocina'),
('Deportes'),
('Libros');
go

-- 2. INSERTAR CLIENTES
insert into Clientes (dni_Cl, nombre_Cl, apellido_Cl, direccion_Cl, fotoPerfil_Cl, localidad_Cl, fechaNacimiento_Cl, correoElectronicp_Cl, contrasenia_Cl, admin_Cl, activo_Cl) values
('11111111', 'Carlos', 'Gómez', 'Av. Corrientes 1234', 'http://img.com', 'CABA', '1985-05-12', 'carlos@mail.com', 'Pass1234', 1, 1),
('22222222', 'María', 'López', 'Calle Flores 567', 'http://img.com', 'Rosario', '1990-08-22', 'maria@mail.com', 'Maria90x', 0, 1),
('33333333', 'Juan', 'Pérez', 'Belgrano 890', 'http://img.com', 'Córdoba', '1995-12-01', 'juan@mail.com', 'JuanP456', 0, 1),
('44444444', 'Ana', 'Martínez', 'San Martín 432', 'http://img.com', 'Mendoza', '1988-03-15', 'ana@mail.com', 'AnaM789!', 0, 1),
('55555555', 'Lucas', 'Rodríguez', 'Rivadavia 111', 'http://img.com', 'La Plata', '2000-07-19', 'lucas@mail.com', 'Lu123456', 0, 0);
go

-- 3. INSERTAR PRODUCTOS
-- Las categorías van del 1 al 5
insert into Productos (nombreProducto_Pd, precioUnitario_Pd, stock_Pd, descripcion_Pd, ImagenUrl_Pd, idCategoria_Pd_Ct, activo_Pd) values
('Smartphone X', 899.99, 50, 'Teléfono inteligente de alta gama', 'http://img.com', 1, 1),
('Auriculares Bluetooth', 59.50, 120, 'Auriculares inalámbricos con cancelación de ruido', 'http://img.com', 1, 1),
('Zapatillas Running', 120.00, 35, 'Zapatillas cómodas para correr largas distancias', 'http://img.com', 2, 1),
('Cafetera Express', 245.00, 15, 'Cafetera automática de acero inoxidable', 'http://img.com', 3, 1),
('Pelota de Fútbol', 35.00, 80, 'Pelota oficial tamaño número 5', 'http://img.com', 4, 1),
('Novela de Ficción', 18.90, 200, 'El último best seller del año', 'http://img.com', 5, 1);
go

-- 4. INSERTAR VENTAS
-- Los DNI corresponden a los clientes creados arriba
insert into Ventas (dni_Cl_Vn, total_Vn, fechaVenta_Vn) values
('11111111', 959.49, '2026-06-01'),
('22222222', 120.00, '2026-06-03'),
('33333333', 72.80, '2026-06-05'),
('44444444', 245.00, '2026-06-08'),
('11111111', 59.50, '2026-06-10');
go

-- 5. INSERTAR DETALLE DE VENTA
-- idVentas_Vn_Dv (1 al 5) e idProducto_Pd_Dv (1 al 6)
insert into DetalleVenta (idProducto_Pd_Dv, idVentas_Vn_Dv, cantidad_Dv, precioUnitario_Dv) values
(1, 1, 1, 899.99), -- Venta 1: 1 Smartphone
(2, 1, 1, 59.50),  -- Venta 1: 1 Auricular
(3, 2, 1, 120.00), -- Venta 2: 1 Zapatillas
(5, 3, 1, 35.00),  -- Venta 3: 1 Pelota
(6, 3, 2, 18.90),  -- Venta 3: 2 Libros
(4, 4, 1, 245.00), -- Venta 4: 1 Cafetera
(2, 5, 1, 59.50);  -- Venta 5: 1 Auricular
go

-- 6. INSERTAR SEGUIMIENTO
-- Corresponde a las 5 ventas creadas
insert into seguimiento (idVenta_Vn_Sg, enCamino_Sg, entregado_Sg) values
(1, 0, 1), -- Venta 1: Entregada
(2, 0, 1), -- Venta 2: Entregada
(3, 1, 0), -- Venta 3: En camino
(4, 0, 0), -- Venta 4: En preparación (no enviado, no entregado)
(5, 0, 0); -- Venta 5: En preparación
go
