create database ajax;
use ajax;
create table Usuario(
	ID INT PRIMARY KEY IDENTITY,
	Usuario VARCHAR(50) not null,
	Contraseña VARCHAR(50) not null
);

alter PROCEDURE validarUser(@Usuario varchar(50), @Contraseña varchar(50))
AS BEGIN
SELECT * FROM Usuario 
where Usuario = @Usuario AND Contraseña = @Contraseña
END

INSERT INTO Usuario (Usuario,Contraseña) values ('admin','admin');
exec validarUser 'admin','admin'
