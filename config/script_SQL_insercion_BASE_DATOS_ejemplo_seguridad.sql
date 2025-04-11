-- Inserción de datos de prueba en la tabla `usuarios`
INSERT INTO `usuarios` (`nombre_usuario`, `email`, `contrasena`, `activo`)
VALUES
('usuario1', 'usuario1@correo.com', '$2y$10$Nrib5zqOVVpo5Lmsyu/fau2DdsUKZbBpxlxBShJ5sBVHPNHDBnJYi', 1),
('usuario2', 'usuario2@correo.com', '$2y$10$Nrib5zqOVVpo5Lmsyu/fau2DdsUKZbBpxlxBShJ5sBVHPNHDBnJYi', 1),
('usuario3', 'usuario3@correo.com', '$2y$10$Nrib5zqOVVpo5Lmsyu/fau2DdsUKZbBpxlxBShJ5sBVHPNHDBnJYi', 1),
('usuario4', 'usuario4@correo.com', '$2y$10$Nrib5zqOVVpo5Lmsyu/fau2DdsUKZbBpxlxBShJ5sBVHPNHDBnJYi', 1),
('usuario5', 'usuario5@correo.com', '$2y$10$Nrib5zqOVVpo5Lmsyu/fau2DdsUKZbBpxlxBShJ5sBVHPNHDBnJYi', 1);

-- Inserción de datos de prueba en la tabla `roles`
INSERT INTO `roles` (`nombre_rol`, `descripcion`)
VALUES
('Administrador', 'Rol con acceso completo al sistema'),
('Usuario', 'Rol con acceso limitado a funcionalidades básicas'),
('Auditor', 'Rol con acceso solo a reportes y auditoría');

-- Inserción de datos de prueba en la tabla `permisos`
INSERT INTO `permisos` (`nombre_permiso`, `descripcion`)
VALUES
('Crear Usuario', 'Permiso para crear nuevos usuarios'),
('Modificar Usuario', 'Permiso para modificar usuarios existentes'),
('Eliminar Usuario', 'Permiso para eliminar usuarios'),
('Ver Auditoría', 'Permiso para ver registros de auditoría');

-- Inserción de datos de prueba en la tabla `usuario_rol`
INSERT INTO `usuario_rol` (`id_usuario`, `id_rol`)
VALUES
(1, 1), -- usuario1 es Administrador
(2, 2), -- usuario2 es Usuario
(3, 2), -- usuario3 es Usuario
(4, 3), -- usuario4 es Auditor
(5, 2); -- usuario5 es Usuario

-- Inserción de datos de prueba en la tabla `rol_permiso`
INSERT INTO `rol_permiso` (`id_rol`, `id_permiso`)
VALUES
(1, 1), -- Administrador tiene permiso de Crear Usuario
(1, 2), -- Administrador tiene permiso de Modificar Usuario
(1, 3), -- Administrador tiene permiso de Eliminar Usuario
(3, 4); -- Auditor tiene permiso de Ver Auditoría

-- Inserción de datos de prueba en la tabla `sesiones`
INSERT INTO `sesiones` (`id_usuario`, `token`, `ip_address`, `inicio`, `fin`)
VALUES
(1, 'token1', '192.168.0.1', '2024-08-27 09:00:00', '2024-08-27 10:00:00'),
(2, 'token2', '192.168.0.2', '2024-08-27 09:15:00', '2024-08-27 09:45:00'),
(3, 'token3', '192.168.0.3', '2024-08-27 09:30:00', NULL), -- Sesión aún activa
(4, 'token4', '192.168.0.4', '2024-08-27 10:00:00', '2024-08-27 11:00:00'),
(5, 'token5', '192.168.0.5', '2024-08-27 10:30:00', NULL); -- Sesión aún activa

-- Inserción de datos de prueba en la tabla `auditoria`
INSERT INTO `auditoria` (`id_usuario`, `accion`, `tabla_afectada`, `registro_afectado`, `descripcion`)
VALUES
(1, 'INSERT', 'usuarios', 1, 'Creación del usuario con ID 1'),
(2, 'UPDATE', 'usuarios', 2, 'Modificación del usuario con ID 2'),
(3, 'DELETE', 'usuarios', 3, 'Eliminación del usuario con ID 3'),
(4, 'SELECT', 'auditoria', 1, 'Consulta de auditoría por el usuario con ID 4'),
(5, 'INSERT', 'sesiones', 5, 'Creación de sesión para el usuario con ID 5');