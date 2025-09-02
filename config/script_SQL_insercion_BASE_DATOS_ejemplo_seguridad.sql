

-- Volcando datos para la tabla ejemplo_seguridad.artista: ~1 rows (aproximadamente)
INSERT INTO `artista` (`ID_Artista`, `Nombre`, `Genero_Musical`) VALUES
	(1, 'Henry', 'Instrumental');


-- Volcando datos para la tabla ejemplo_seguridad.permisos: ~0 rows (aproximadamente)
INSERT INTO `permisos` (`id_permiso`, `nombre_permiso`, `descripcion`, `creado_el`, `actualizado_el`) VALUES
	(1, 'Crear Usuario', 'Permiso para crear nuevos usuarios', '2025-09-02 08:20:14', '2025-09-02 08:20:14'),
	(2, 'Modificar Usuario', 'Permiso para modificar usuarios existentes', '2025-09-02 08:20:14', '2025-09-02 08:20:14'),
	(3, 'Eliminar Usuario', 'Permiso para eliminar usuarios', '2025-09-02 08:20:14', '2025-09-02 08:20:14'),
	(4, 'Ver Auditoría', 'Permiso para ver registros de auditoría', '2025-09-02 08:20:14', '2025-09-02 08:20:14');

-- Volcando datos para la tabla ejemplo_seguridad.roles: ~0 rows (aproximadamente)
INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `creado_el`, `actualizado_el`) VALUES
	(1, 'Administrador', 'Rol con acceso completo al sistema', '2025-09-02 08:20:00', '2025-09-02 08:20:00'),
	(2, 'Usuario', 'Rol con acceso limitado a funcionalidades básicas', '2025-09-02 08:20:00', '2025-09-02 08:20:00'),
	(3, 'Auditor', 'Rol con acceso solo a reportes y auditoría', '2025-09-02 08:20:00', '2025-09-02 08:20:00');

-- Volcando datos para la tabla ejemplo_seguridad.rol_permiso: ~0 rows (aproximadamente)
INSERT INTO `rol_permiso` (`id_rol`, `id_permiso`, `asignado_el`) VALUES
	(1, 1, '2025-09-02 08:21:11'),
	(1, 2, '2025-09-02 08:21:11'),
	(1, 3, '2025-09-02 08:21:11'),
	(3, 4, '2025-09-02 08:21:11');

-- Volcando datos para la tabla ejemplo_seguridad.usuarios: ~1 rows (aproximadamente)
INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `contrasena`, `activo`, `creado_el`, `actualizado_el`) VALUES
	(1, 'henry', 'henry.garzon@unad.edu.co', '$2y$10$pJJWGXaSP3IqtJJzXjkrUe3AsEnQA7ULKpO5kFchTK3DE2Z5dlD0G', 1, '2025-09-02 07:55:48', '2025-09-02 07:55:48');

-- Volcando datos para la tabla ejemplo_seguridad.usuario_rol: ~0 rows (aproximadamente)

