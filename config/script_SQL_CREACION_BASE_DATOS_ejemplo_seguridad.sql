
-- Volcando estructura para tabla ejemplo_seguridad.artista
CREATE TABLE IF NOT EXISTS artista (
  ID_Artista int NOT NULL AUTO_INCREMENT,
  Nombre varchar(45) NOT NULL,
  Genero_Musical varchar(45) NOT NULL,
  PRIMARY KEY (ID_Artista)
) ;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ejemplo_seguridad.programa_concierto
CREATE TABLE IF NOT EXISTS programa_concierto (
  ID_programa int NOT NULL AUTO_INCREMENT,
  Numeros_concierto int NOT NULL,
  PRIMARY KEY (ID_programa)
) ;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.concierto
CREATE TABLE IF NOT EXISTS concierto (
  ID_Concierto int NOT NULL AUTO_INCREMENT,
  Fecha datetime NOT NULL,
  Entradas_vacias int NOT NULL,
  Programa_Concierto_ID_programa int NOT NULL,
  Artista_ID_Artista int NOT NULL,
  PRIMARY KEY (ID_Concierto,Programa_Concierto_ID_programa,Artista_ID_Artista),
  KEY fk_concierto_Programa_Concierto1_idx (Programa_Concierto_ID_programa),
  KEY fk_concierto_Artista1_idx (Artista_ID_Artista),
  CONSTRAINT fk_concierto_Artista1 FOREIGN KEY (Artista_ID_Artista) REFERENCES artista (ID_Artista),
  CONSTRAINT fk_concierto_Programa_Concierto1 FOREIGN KEY (Programa_Concierto_ID_programa) REFERENCES programa_concierto (ID_programa)
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.escala_tecnica
CREATE TABLE IF NOT EXISTS escala_tecnica (
  ID_Escala int NOT NULL AUTO_INCREMENT,
  NombreEscalaTecnica varchar(45) NOT NULL,
  PRIMARY KEY (ID_Escala)
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.local
CREATE TABLE IF NOT EXISTS local (
  ID_Local int NOT NULL AUTO_INCREMENT,
  Nombre varchar(45) NOT NULL,
  Ciudad varchar(45) NOT NULL,
  Pais varchar(45) NOT NULL,
  Direccion varchar(100) NOT NULL,
  Telefono varchar(45) NOT NULL,
  PRIMARY KEY (ID_Local)
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.realizacion_escala
CREATE TABLE IF NOT EXISTS realizacion_escala (
  ID_Realizacion int NOT NULL AUTO_INCREMENT,
  Fecha datetime DEFAULT NULL,
  Escala_Tecnica_ID_Escala int NOT NULL,
  Local_ID_Local int NOT NULL,
  Programa_Concierto_ID_programa int NOT NULL,
  PRIMARY KEY (ID_Realizacion,Escala_Tecnica_ID_Escala,Local_ID_Local,Programa_Concierto_ID_programa),
  KEY fk_Realizacion_Escala_Escala_Tecnica_idx (Escala_Tecnica_ID_Escala),
  KEY fk_Realizacion_Escala_Local1_idx (Local_ID_Local),
  KEY fk_Realizacion_Escala_Programa_Concierto1_idx (Programa_Concierto_ID_programa),
  CONSTRAINT fk_Realizacion_Escala_Escala_Tecnica FOREIGN KEY (Escala_Tecnica_ID_Escala) REFERENCES escala_tecnica (ID_Escala),
  CONSTRAINT fk_Realizacion_Escala_Local1 FOREIGN KEY (Local_ID_Local) REFERENCES local (ID_Local),
  CONSTRAINT fk_Realizacion_Escala_Programa_Concierto1 FOREIGN KEY (Programa_Concierto_ID_programa) REFERENCES programa_concierto (ID_programa)
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.roles
CREATE TABLE IF NOT EXISTS roles (
  id_rol int NOT NULL AUTO_INCREMENT,
  nombre_rol varchar(50) NOT NULL,
  descripcion varchar(255) DEFAULT NULL,
  creado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id_rol),
  UNIQUE KEY nombre_rol (nombre_rol)
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.permisos
CREATE TABLE IF NOT EXISTS permisos (
  id_permiso int NOT NULL AUTO_INCREMENT,
  nombre_permiso varchar(50) NOT NULL,
  descripcion varchar(255) DEFAULT NULL,
  creado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id_permiso),
  UNIQUE KEY nombre_permiso (nombre_permiso)
);

-- La exportación de datos fue deseleccionada.


-- Volcando estructura para tabla ejemplo_seguridad.rol_permiso
CREATE TABLE IF NOT EXISTS rol_permiso (
  id_rol int NOT NULL,
  id_permiso int NOT NULL,
  asignado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_rol,id_permiso),
  KEY id_permiso (id_permiso),
  CONSTRAINT rol_permiso_ibfk_1 FOREIGN KEY (id_rol) REFERENCES roles (id_rol),
  CONSTRAINT rol_permiso_ibfk_2 FOREIGN KEY (id_permiso) REFERENCES permisos (id_permiso)
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario int NOT NULL AUTO_INCREMENT,
  nombre_usuario varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  contrasena varchar(255) NOT NULL,
  activo tinyint(1) DEFAULT '1',
  creado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id_usuario),
  UNIQUE KEY nombre_usuario (nombre_usuario),
  UNIQUE KEY email (email)
) ;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.sesiones
CREATE TABLE IF NOT EXISTS sesiones (
  id_sesion int NOT NULL AUTO_INCREMENT,
  id_usuario int DEFAULT NULL,
  token varchar(255) NOT NULL,
  ip_address varchar(45) DEFAULT NULL,
  inicio timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  fin timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id_sesion),
  UNIQUE KEY token (token),
  KEY id_usuario (id_usuario),
  CONSTRAINT sesiones_ibfk_1 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.auditoria
CREATE TABLE IF NOT EXISTS auditoria (
  id_auditoria int NOT NULL AUTO_INCREMENT,
  id_usuario int DEFAULT NULL,
  accion varchar(50) DEFAULT NULL,
  tabla_afectada varchar(50) DEFAULT NULL,
  registro_afectado int DEFAULT NULL,
  descripcion text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  realizado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_auditoria),
  KEY id_usuario (id_usuario),
  CONSTRAINT auditoria_ibfk_1 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla ejemplo_seguridad.usuario_rol
CREATE TABLE IF NOT EXISTS usuario_rol (
  id_usuario int NOT NULL,
  id_rol int NOT NULL,
  asignado_el timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_usuario,id_rol),
  KEY id_rol (id_rol),
  CONSTRAINT usuario_rol_ibfk_1 FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
  CONSTRAINT usuario_rol_ibfk_2 FOREIGN KEY (id_rol) REFERENCES roles (id_rol)
);

-- La exportación de datos fue deseleccionada.

