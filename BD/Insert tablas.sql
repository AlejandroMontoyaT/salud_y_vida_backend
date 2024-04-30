-- Agregar 5 registros a la tabla "tipo_usuario"
INSERT INTO tipo_usuario (rol) VALUES
  ('Administrador'),
  ('Cliente'),
  ('Proveedor'),
  ('Empleado'),
  ('Invitado');

-- Agregar 5 registros a la tabla "usuarios"
INSERT INTO usuarios (id_tipo, nombres, apellidos, fecha_nacimiento, genero, correo, password, fecha_registro, estatus) VALUES
  (1, 'Juan', 'Pérez', '1990-01-01', 'Masculino', 'juan@example.com', 'password1', NOW(), 'Activo'),
  (2, 'María', 'González', '1985-05-10', 'Femenino', 'maria@example.com', 'password2', NOW(), 'Activo'),
  (3, 'Carlos', 'López', '1992-08-15', 'Masculino', 'carlos@example.com', 'password3', NOW(), 'Activo'),
  (4, 'Laura', 'Martínez', '1988-12-20', 'Femenino', 'laura@example.com', 'password4', NOW(), 'Activo'),
  (5, 'Pedro', 'Ramírez', '1995-03-25', 'Masculino', 'pedro@example.com', 'password5', NOW(), 'Activo');

-- Agregar 5 registros a la tabla "direcciones"
INSERT INTO direcciones (usuarios_id_usuarios, calle, colonia, municipio_alcaldia, estado, codigo_postal) VALUES
  (1, 'Calle 1', 'Colonia 1', 'Municipio 1', 'Estado 1', '12345'),
  (2, 'Calle 2', 'Colonia 2', 'Municipio 2', 'Estado 2', '54321'),
  (3, 'Calle 3', 'Colonia 3', 'Municipio 3', 'Estado 3', '98765'),
  (4, 'Calle 4', 'Colonia 4', 'Municipio 4', 'Estado 4', '56789'),
  (5, 'Calle 5', 'Colonia 5', 'Municipio 5', 'Estado 5', '24680');

-- Agregar 5 registros a la tabla "tarjetas"
INSERT INTO tarjetas (id_tarjeta, numero_tarjeta, expiracion, direccion_tarjeta, usuarios_id_usuarios) VALUES
  (1, '1234567890123456', '12/2025', 'Dirección 1', 1),
  (2, '9876543210987654', '06/2024', 'Dirección 2', 2),
  (3, '1111222233334444', '09/2023', 'Dirección 3', 3),
  (4, '5555666677778888', '03/2026', 'Dirección 4', 4),
  (5, '9999888877776666', '11/2022', 'Dirección 5', 5);

-- Agregar 5 registros a la tabla "categorias"
INSERT INTO categorias (material) VALUES
  ('Metal'),
  ('Plástico'),
  ('Madera'),
  ('Acetato'),
  ('Titanio');

-- Agregar 5 registros a la tabla "lentes"
INSERT INTO lentes (nombre_lentes, url_imagen, marca, descripcion, largo, ancho, alto, modelo_producto, sku, precio) VALUES
  ('Lente 1', 'imagen1.jpg', 'Marca 1', 'Descripción 1', '10', '5', '3', 'Modelo 1', 'SKU1', 100.00),
  ('Lente 2', 'imagen2.jpg', 'Marca 2', 'Descripción 2', '12', '6', '4', 'Modelo 2', 'SKU2', 150.00),
  ('Lente 3', 'imagen3.jpg', 'Marca 3', 'Descripción 3', '11', '5.5', '3.5', 'Modelo 3', 'SKU3', 120.00),
  ('Lente 4', 'imagen4.jpg', 'Marca 4', 'Descripción 4', '13', '7', '4.5', 'Modelo 4', 'SKU4', 180.00),
  ('Lente 5', 'imagen5.jpg', 'Marca 5', 'Descripción 5', '9', '4.5', '2.5', 'Modelo 5', 'SKU5', 90.00);

-- Agregar 5 registros a la tabla "lentes_has_categorias"
INSERT INTO lentes_has_categorias (lentes_id_lentes, categorias_id_categorias) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

-- Agregar 5 registros a la tabla "tipos de pago"
INSERT INTO `tipos de pago` (id_tipo_pago, descripcion_tipo_pago) VALUES
  (1, 'Tarjeta de crédito'),
  (2, 'Tarjeta de débito'),
  (3, 'PayPal'),
  (4, 'Transferencia bancaria'),
  (5, 'Efectivo');

-- Agregar 5 registros a la tabla "compras"
INSERT INTO compras (Id_usuario, id_tipo_pago, fecha_compra, pago_total) VALUES
  (1, 1, NOW(), 500.00),
  (2, 2, NOW(), 750.00),
  (3, 3, NOW(), 1000.00),
  (4, 4, NOW(), 1250.00),
  (5, 5, NOW(), 800.00);

-- Agregar 5 registros a la tabla "compras_has_lentes"
INSERT INTO compras_has_lentes (compras_id_compras, lentes_id_lentes, cantidad) VALUES
  (1, 1, 2),
  (1, 2, 1),
  (2, 3, 3),
  (3, 4, 2),
  (4, 5, 1);

-- Agregar 5 registros a la tabla "carrito_compras"
INSERT INTO carrito_compras (id_carrito, fecha_actualizacion, usuarios_id_usuarios) VALUES
  (1, NOW(), 1),
  (2, NOW(), 2),
  (3, NOW(), 3),
  (4, NOW(), 4),
  (5, NOW(), 5);

-- Agregar 5 registros a la tabla "carrito_compras_has_lentes"
INSERT INTO carrito_compras_has_lentes (id_carrito, id_lentes, cantidad) VALUES
  (1, 1, 1),
  (1, 2, 2),
  (2, 3, 1),
  (3, 4, 3),
  (4, 5, 2);

-- Agregar 5 registros a la tabla "citas"
INSERT INTO citas (usuarios_id_usuarios, fecha_hora_cita) VALUES
  (1, '2024-05-01 10:00:00'),
  (2, '2024-05-02 14:30:00'),
  (3, '2024-05-03 11:15:00'),
  (4, '2024-05-04 16:45:00'),
  (5, '2024-05-05 09:30:00');