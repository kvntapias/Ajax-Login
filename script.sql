create database ajax;
use ajax;
create table Usuario(
	ID INT PRIMARY KEY IDENTITY,
	Usuario VARCHAR(50) not null,
	Contraseņa VARCHAR(50) not null
);

alter PROCEDURE validarUser(@Usuario varchar(50), @Contraseņa varchar(50))
AS BEGIN
SELECT * FROM Usuario 
where Usuario = @Usuario AND Contraseņa = @Contraseņa
END

INSERT INTO Usuario (Usuario,Contraseņa) values ('admin','admin');
exec validarUser 'admin','admin'
