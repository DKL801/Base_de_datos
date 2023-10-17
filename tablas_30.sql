-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dbfinal
CREATE DATABASE IF NOT EXISTS `dbfinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbfinal`;

-- Dumping structure for table dbfinal.categoria_producto
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `ID_Categoria` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.categoria_producto: ~0 rows (approximately)

-- Dumping structure for table dbfinal.categoria_producto_producto
CREATE TABLE IF NOT EXISTS `categoria_producto_producto` (
  `ID_Categoria_Producto_Producto` int NOT NULL,
  `ID_Categoria` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  PRIMARY KEY (`ID_Categoria_Producto_Producto`),
  KEY `ID_Categoria` (`ID_Categoria`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `categoria_producto_producto_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria_producto` (`ID_Categoria`),
  CONSTRAINT `categoria_producto_producto_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.categoria_producto_producto: ~0 rows (approximately)

-- Dumping structure for table dbfinal.categoria_producto_promocion
CREATE TABLE IF NOT EXISTS `categoria_producto_promocion` (
  `ID_Categoria_Producto_Promocion` int NOT NULL,
  `ID_Categoria` int DEFAULT NULL,
  `ID_Promocion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Categoria_Producto_Promocion`),
  KEY `ID_Categoria` (`ID_Categoria`),
  KEY `ID_Promocion` (`ID_Promocion`),
  CONSTRAINT `categoria_producto_promocion_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria_producto` (`ID_Categoria`),
  CONSTRAINT `categoria_producto_promocion_ibfk_2` FOREIGN KEY (`ID_Promocion`) REFERENCES `promocion` (`ID_Promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.categoria_producto_promocion: ~0 rows (approximately)

-- Dumping structure for table dbfinal.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID_Cliente` int NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.cliente: ~0 rows (approximately)

-- Dumping structure for table dbfinal.cliente_tarjeta
CREATE TABLE IF NOT EXISTS `cliente_tarjeta` (
  `ID_Cliente_Tarjeta` int NOT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Numero_Tarjeta` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Fecha_Expiracion` date DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente_Tarjeta`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `cliente_tarjeta_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.cliente_tarjeta: ~0 rows (approximately)

-- Dumping structure for table dbfinal.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `ID_Departamento` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.departamento: ~0 rows (approximately)

-- Dumping structure for table dbfinal.detalle_devolucion
CREATE TABLE IF NOT EXISTS `detalle_devolucion` (
  `ID_Detalle_Devolucion` int NOT NULL,
  `ID_Devolucion` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Devolucion`),
  KEY `ID_Devolucion` (`ID_Devolucion`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `detalle_devolucion_ibfk_1` FOREIGN KEY (`ID_Devolucion`) REFERENCES `devolucion` (`ID_Devolucion`),
  CONSTRAINT `detalle_devolucion_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.detalle_devolucion: ~0 rows (approximately)

-- Dumping structure for table dbfinal.detalle_ingreso
CREATE TABLE IF NOT EXISTS `detalle_ingreso` (
  `ID_Detalle_Ingreso` int NOT NULL,
  `ID_Ingreso` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Ingreso`),
  KEY `ID_Ingreso` (`ID_Ingreso`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `detalle_ingreso_ibfk_1` FOREIGN KEY (`ID_Ingreso`) REFERENCES `ingreso` (`ID_Ingreso`),
  CONSTRAINT `detalle_ingreso_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.detalle_ingreso: ~0 rows (approximately)

-- Dumping structure for table dbfinal.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `ID_Detalle_Pedido` int NOT NULL,
  `ID_Pedido` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Pedido`),
  KEY `ID_Pedido` (`ID_Pedido`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.detalle_pedido: ~0 rows (approximately)

-- Dumping structure for table dbfinal.detalle_promocion
CREATE TABLE IF NOT EXISTS `detalle_promocion` (
  `ID_Detalle_Promocion` int NOT NULL,
  `ID_Promocion` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Promocion`),
  KEY `ID_Promocion` (`ID_Promocion`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `detalle_promocion_ibfk_1` FOREIGN KEY (`ID_Promocion`) REFERENCES `promocion` (`ID_Promocion`),
  CONSTRAINT `detalle_promocion_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.detalle_promocion: ~0 rows (approximately)

-- Dumping structure for table dbfinal.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `ID_Detalle_Venta` int NOT NULL,
  `ID_Venta` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Venta`),
  KEY `ID_Venta` (`ID_Venta`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`ID_Venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.detalle_venta: ~0 rows (approximately)

-- Dumping structure for table dbfinal.devolucion
CREATE TABLE IF NOT EXISTS `devolucion` (
  `ID_Devolucion` int NOT NULL,
  `ID_Venta` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Motivo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Devolucion`),
  KEY `ID_Venta` (`ID_Venta`),
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`ID_Venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.devolucion: ~0 rows (approximately)

-- Dumping structure for table dbfinal.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `ID_Empleado` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Apellido` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Telefono` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Cargo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ID_Departamento` int DEFAULT NULL,
  PRIMARY KEY (`ID_Empleado`),
  KEY `ID_Departamento` (`ID_Departamento`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ID_Departamento`) REFERENCES `departamento` (`ID_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.empleado: ~0 rows (approximately)

-- Dumping structure for table dbfinal.empleado_departamento
CREATE TABLE IF NOT EXISTS `empleado_departamento` (
  `ID_Empleado_Departamento` int NOT NULL,
  `ID_Empleado` int DEFAULT NULL,
  `ID_Departamento` int DEFAULT NULL,
  PRIMARY KEY (`ID_Empleado_Departamento`),
  KEY `ID_Empleado` (`ID_Empleado`),
  KEY `ID_Departamento` (`ID_Departamento`),
  CONSTRAINT `empleado_departamento_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`),
  CONSTRAINT `empleado_departamento_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `departamento` (`ID_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.empleado_departamento: ~0 rows (approximately)

-- Dumping structure for table dbfinal.empleado_sucursal
CREATE TABLE IF NOT EXISTS `empleado_sucursal` (
  `ID_Empleado_Sucursal` int NOT NULL,
  `ID_Empleado` int DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  PRIMARY KEY (`ID_Empleado_Sucursal`),
  KEY `ID_Empleado` (`ID_Empleado`),
  KEY `ID_Sucursal` (`ID_Sucursal`),
  CONSTRAINT `empleado_sucursal_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`),
  CONSTRAINT `empleado_sucursal_ibfk_2` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID_Sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.empleado_sucursal: ~0 rows (approximately)

-- Dumping structure for table dbfinal.factura
CREATE TABLE IF NOT EXISTS `factura` (
  `ID_Factura` int NOT NULL,
  `ID_Venta` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Factura`),
  KEY `ID_Venta` (`ID_Venta`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`ID_Venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.factura: ~0 rows (approximately)

-- Dumping structure for table dbfinal.ingreso
CREATE TABLE IF NOT EXISTS `ingreso` (
  `ID_Ingreso` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Ingreso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.ingreso: ~0 rows (approximately)

-- Dumping structure for table dbfinal.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `ID_Inventario` int NOT NULL,
  `ID_Producto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Fecha_Actualizacion` date DEFAULT NULL,
  PRIMARY KEY (`ID_Inventario`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.inventario: ~0 rows (approximately)

-- Dumping structure for table dbfinal.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `ID_Pago` int NOT NULL,
  `ID_Factura` int DEFAULT NULL,
  `Metodo_Pago` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Pago`),
  KEY `ID_Factura` (`ID_Factura`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`ID_Factura`) REFERENCES `factura` (`ID_Factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.pago: ~0 rows (approximately)

-- Dumping structure for table dbfinal.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `ID_Pedido` int NOT NULL,
  `ID_Proveedor` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Pedido`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.pedido: ~0 rows (approximately)

-- Dumping structure for table dbfinal.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `ID_Producto` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Cantidad_En_Stock` int DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.producto: ~0 rows (approximately)

-- Dumping structure for table dbfinal.promocion
CREATE TABLE IF NOT EXISTS `promocion` (
  `ID_Promocion` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Descuento` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.promocion: ~0 rows (approximately)

-- Dumping structure for table dbfinal.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `ID_Proveedor` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Telefono` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.proveedor: ~0 rows (approximately)

-- Dumping structure for table dbfinal.proveedor_producto
CREATE TABLE IF NOT EXISTS `proveedor_producto` (
  `ID_Proveedor_Producto` int NOT NULL,
  `ID_Proveedor` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor_Producto`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `proveedor_producto_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`),
  CONSTRAINT `proveedor_producto_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.proveedor_producto: ~0 rows (approximately)

-- Dumping structure for table dbfinal.reporte
CREATE TABLE IF NOT EXISTS `reporte` (
  `ID_Reporte` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  PRIMARY KEY (`ID_Reporte`),
  KEY `ID_Sucursal` (`ID_Sucursal`),
  CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID_Sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.reporte: ~0 rows (approximately)

-- Dumping structure for table dbfinal.sucursal
CREATE TABLE IF NOT EXISTS `sucursal` (
  `ID_Sucursal` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Telefono` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.sucursal: ~0 rows (approximately)

-- Dumping structure for table dbfinal.sucursal_departamento
CREATE TABLE IF NOT EXISTS `sucursal_departamento` (
  `ID_Sucursal_Departamento` int NOT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  `ID_Departamento` int DEFAULT NULL,
  PRIMARY KEY (`ID_Sucursal_Departamento`),
  KEY `ID_Sucursal` (`ID_Sucursal`),
  KEY `ID_Departamento` (`ID_Departamento`),
  CONSTRAINT `sucursal_departamento_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID_Sucursal`),
  CONSTRAINT `sucursal_departamento_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `departamento` (`ID_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.sucursal_departamento: ~0 rows (approximately)

-- Dumping structure for table dbfinal.sucursal_empleado
CREATE TABLE IF NOT EXISTS `sucursal_empleado` (
  `ID_Sucursal_Empleado` int NOT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  `ID_Empleado` int DEFAULT NULL,
  PRIMARY KEY (`ID_Sucursal_Empleado`),
  KEY `ID_Sucursal` (`ID_Sucursal`),
  KEY `ID_Empleado` (`ID_Empleado`),
  CONSTRAINT `sucursal_empleado_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID_Sucursal`),
  CONSTRAINT `sucursal_empleado_ibfk_2` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.sucursal_empleado: ~0 rows (approximately)

-- Dumping structure for table dbfinal.sucursal_producto
CREATE TABLE IF NOT EXISTS `sucursal_producto` (
  `ID_Sucursal_Producto` int NOT NULL,
  `ID_Sucursal` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  PRIMARY KEY (`ID_Sucursal_Producto`),
  KEY `ID_Sucursal` (`ID_Sucursal`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `sucursal_producto_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID_Sucursal`),
  CONSTRAINT `sucursal_producto_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.sucursal_producto: ~0 rows (approximately)

-- Dumping structure for table dbfinal.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `ID_Venta` int NOT NULL,
  `ID_Cliente` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table dbfinal.venta: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
