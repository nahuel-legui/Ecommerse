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




