CREATE TABLE IF NOT EXISTS envios (
	id int not null primary key auto_increment,
	prioridad int null default 5,
	fecha_alta datetime not null,
	fecha_inicio datetime not null,
	fecha_fin datetime not null,
	fecha_maxima datetime not null,
	num_envios int not null default 0,
	num_envios_realizados int not null default 0,
	num_envios_pendientes int not null default 0,
	num_envios_fallidos int not null default 0,
	num_envios_devueltos int not null default 0,
	activo int not null default 0,
	ultimo timestamp null default CURRENT_TIMESTAMP,
	idioma varchar(50) null default 'ES',
	asunto varchar(250) null default 'Envio %num_envio% %timestamp%',
	plantilla text null default '',
	eliminar_campos_nulos int default 1,
	notas text null default null
);

CREATE TABLE IF NOT EXISTS envios_mensajes (
	id int not null primary key auto_increment,
	id_envio int not null default '0',
	email varchar(255) null default null,
	asunto varchar(255) null default null,
	datos text null default '',
	html text null default '',
	texto text null default '',
	prioridad int null default 5,
	fecha_alta datetime not null,
	fecha_envio datetime not null,
	fecha_ultimo_reintento datetime not null,
	num_envios int not null default 0,
	num_envios_realizados int not null default 0,
	num_envios_fallidos int not null default 0,
	num_envios_devueltos int not null default 0,
	activo int not null default 0,
	ultimo timestamp null default CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS envios_log (
	id int not null primary key auto_increment,
	id_envio int not null default '0',
	id_mensaje int not null default '0',
	email varchar(255) null default null,
	asunto varchar(255) null default null,
	texto text null default null	
);

CREATE TABLE IF NOT EXISTS emisores (
	id int not null primary key auto_increment,
	nombre varchar(255) null default null,
	descripcion text null default null,
	notas text null default null	
);

CREATE TABLE IF NOT EXISTS audiencia (
	id int not null primary key auto_increment,
	id_emisor int not null default '0',
	nombre varchar(255) null default null,
	descripcion text null default null,
	texto text null default null,
	notas text null default null
);
