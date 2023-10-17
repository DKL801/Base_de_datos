CREATE DATABASE dbfinal
USE dbfinal
-- Tabla Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Direccion VARCHAR(100),
    Telefono VARCHAR(20)
);


-- Tabla Producto
CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(100),
    Precio DECIMAL(10, 2),
    Cantidad_En_Stock INT
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    ID_Proveedor INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(20)
);

-- Tabla Venta
CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY,
    ID_Cliente INT,
    Fecha DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabla Detalle_Venta
CREATE TABLE Detalle_Venta (
    ID_Detalle_Venta INT PRIMARY KEY,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    ID_Empleado INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(20),
    Cargo NVARCHAR(100),
    ID_Departamento INT,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);

-- Tabla Sucursal
CREATE TABLE Sucursal (
    ID_Sucursal INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(20)
);

-- Tabla Empleado_Sucursal
CREATE TABLE Empleado_Sucursal (
    ID_Empleado_Sucursal INT PRIMARY KEY,
    ID_Empleado INT,
    ID_Sucursal INT,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    ID_Proveedor INT,
    Fecha DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);

-- Tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    ID_Detalle_Pedido INT PRIMARY KEY,
    ID_Pedido INT,
    ID_Producto INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Inventario
CREATE TABLE Inventario (
    ID_Inventario INT PRIMARY KEY,
    ID_Producto INT,
    Cantidad INT,
    Fecha_Actualizacion DATE,
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Factura
CREATE TABLE Factura (
    ID_Factura INT PRIMARY KEY,
    ID_Venta INT,
    Fecha DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta)
);

-- Tabla Pago
CREATE TABLE Pago (
    ID_Pago INT PRIMARY KEY,
    ID_Factura INT,
    Metodo_Pago NVARCHAR(100),
    Monto DECIMAL(10, 2),
    FOREIGN KEY (ID_Factura) REFERENCES Factura(ID_Factura)
);

-- Tabla Promocion
CREATE TABLE Promocion (
    ID_Promocion INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(100),
    Descuento DECIMAL(5, 2)
);

-- Tabla Detalle_Promocion
CREATE TABLE Detalle_Promocion (
    ID_Detalle_Promocion INT PRIMARY KEY,
    ID_Promocion INT,
    ID_Producto INT,
    FOREIGN KEY (ID_Promocion) REFERENCES Promocion(ID_Promocion),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Departamento
CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Nombre NVARCHAR(100)
);

-- Tabla Empleado_Departamento
CREATE TABLE Empleado_Departamento (
    ID_Empleado_Departamento INT PRIMARY KEY,
    ID_Empleado INT,
    ID_Departamento INT,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);

-- Tabla Reporte
CREATE TABLE Reporte (
    ID_Reporte INT PRIMARY KEY,
    Fecha DATE,
    Descripcion NVARCHAR(100),
    ID_Sucursal INT,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

-- Tabla Devolucion
CREATE TABLE Devolucion (
    ID_Devolucion INT PRIMARY KEY,
    ID_Venta INT,
    Fecha DATE,
    Motivo NVARCHAR(100),
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta)
);

-- Tabla Detalle_Devolucion
CREATE TABLE Detalle_Devolucion (
    ID_Detalle_Devolucion INT PRIMARY KEY,
    ID_Devolucion INT,
    ID_Producto INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Devolucion) REFERENCES Devolucion(ID_Devolucion),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Cliente_Tarjeta
CREATE TABLE Cliente_Tarjeta (
    ID_Cliente_Tarjeta INT PRIMARY KEY,
    ID_Cliente INT,
    Numero_Tarjeta NVARCHAR(100),
    Fecha_Expiracion DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabla Proveedor_Producto
CREATE TABLE Proveedor_Producto (
    ID_Proveedor_Producto INT PRIMARY KEY,
    ID_Proveedor INT,
    ID_Producto INT,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Categoria_Producto
CREATE TABLE Categoria_Producto (
    ID_Categoria INT PRIMARY KEY,
    Nombre NVARCHAR(100)
);

-- Tabla Categoria_Producto_Producto
CREATE TABLE Categoria_Producto_Producto (
    ID_Categoria_Producto_Producto INT PRIMARY KEY,
    ID_Categoria INT,
    ID_Producto INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria_Producto(ID_Categoria),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Categoria_Producto_Promocion
CREATE TABLE Categoria_Producto_Promocion (
    ID_Categoria_Producto_Promocion INT PRIMARY KEY,
    ID_Categoria INT,
    ID_Promocion INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria_Producto(ID_Categoria),
    FOREIGN KEY (ID_Promocion) REFERENCES Promocion(ID_Promocion)
);

-- Tabla Sucursal_Producto
CREATE TABLE Sucursal_Producto (
    ID_Sucursal_Producto INT PRIMARY KEY,
    ID_Sucursal INT,
    ID_Producto INT,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Ingreso
CREATE TABLE Ingreso (
    ID_Ingreso INT PRIMARY KEY,
    Fecha DATE,
    Total DECIMAL(10, 2)
);

-- Tabla Detalle_Ingreso
CREATE TABLE Detalle_Ingreso (
    ID_Detalle_Ingreso INT PRIMARY KEY,
    ID_Ingreso INT,
    ID_Producto INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Ingreso) REFERENCES Ingreso(ID_Ingreso),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Sucursal_Empleado
CREATE TABLE Sucursal_Empleado (
    ID_Sucursal_Empleado INT PRIMARY KEY,
    ID_Sucursal INT,
    ID_Empleado INT,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

-- Tabla Sucursal_Departamento
CREATE TABLE Sucursal_Departamento (
    ID_Sucursal_Departamento INT PRIMARY KEY,
    ID_Sucursal INT,
    ID_Departamento INT,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal),
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);







