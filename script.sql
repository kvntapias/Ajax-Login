create database ajax;
use ajax;
create table Usuario(
	ID INT PRIMARY KEY IDENTITY,
	Usuario VARCHAR(50) not null,
	Contrase�a VARCHAR(50) not null
);

alter PROCEDURE validarUser(@Usuario varchar(50), @Contrase�a varchar(50))
AS BEGIN
SELECT * FROM Usuario 
where Usuario = @Usuario AND Contrase�a = @Contrase�a
END

INSERT INTO Usuario (Usuario,Contrase�a) values ('admin','admin');
exec validarUser 'admin','admin'
