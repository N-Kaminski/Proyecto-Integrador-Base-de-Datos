
	-- ELIMINAR FOREIGN KEY
	ALTER TABLE Vendedor DROP FOREIGN KEY FK_Vendedor_Cliente;

	-- INSERTAR DATOS
	INSERT INTO Vendedor (nombreVend, apellidoVend, sexoVend, telefonoVend, fechaContrato, cedulaReco)
	VALUES
	('Juan', 'Pérez', 'M', '1234567890', '2020-01-01', '56781234C'),
	('Ana', 'García', 'F', '0987654321', '2019-05-15', '12345678A'),
	('Luis', 'Martínez', 'M', '1122334455', '2018-07-20', '87654321B');


	INSERT INTO Familiar (codigoVend, nombre, fechaNac, parentesco, sexo)
	VALUES
	(1, 'María', '2005-03-14', 'Hija', 'F'),
	(2, 'Carlos', '2010-08-21', 'Hijo', 'M'),
	(3, 'Lucía', '1985-06-25', 'Esposa', 'F');


	INSERT INTO Cliente (cedulaCli, nombreCli, apellidoCli, limiteCredito, calle, nro, ciudad, codigoVend, cedulaReco)
	VALUES
	('12345678A', 'Pedro', 'López', 3000, 'Calle 1', '123', 'Ciudad A', 1, NULL),
	('87654321B', 'Marta', 'Díaz', 4500, 'Calle 2', '456', 'Ciudad B', 2, '12345678A'),
	('56781234C', 'José', 'Ramírez', 5000, 'Calle 3', '789', 'Ciudad C', 3, '87654321B'),
	('12345678B', 'Ana', 'Martínez', 1000, 'Calle 4', '124', 'Ciudad A', 1, '12345678A'),
	('87654321C', 'Luis', 'Gómez', 1500, 'Calle 5', '457', 'Ciudad B', 2, '87654321B'),
	('56781234D', 'María', 'Fernández', 2000, 'Calle 6', '790', 'Ciudad C', 3, '56781234C'),
	('12345678D', 'Carlos', 'Pérez', 2500, 'Calle 7', '125', 'Ciudad D', 1, '12345678B'),
	('87654321E', 'Lucía', 'Torres', 3000, 'Calle 8', '458', 'Ciudad D', 2, '87654321C'),
	('56781234E', 'Miguel', 'Luna', 3500, 'Calle 9', '791', 'Ciudad A', 3, '56781234D'),
	('12345678F', 'Elena', 'Vargas', 4000, 'Calle 10', '126', 'Ciudad B', 1, '12345678D'),
	('87654321F', 'Raúl', 'Navarro', 4500, 'Calle 11', '459', 'Ciudad C', 2, '87654321E'),
	('56781234F', 'Gloria', 'Reyes', 5000, 'Calle 12', '792', 'Ciudad D', 3, '56781234E'),
	('87654321G', 'Sandra', 'Ruiz', 100, 'Calle 14', '460', 'Ciudad B', 2, '12345678F'),
	('56781234G', 'Javier', 'Hernández', 500, 'Calle 15', '793', 'Ciudad C', 3, '87654321F'),
	('12345678H', 'Cristina', 'Soto', 750, 'Calle 16', '128', 'Ciudad D', 1, '56781234F'),
	('87654321H', 'Pablo', 'Ramos', 1000, 'Calle 17', '461', 'Ciudad A', 2, '12345678H'),
	('56781234H', 'Rosa', 'Serrano', 1500, 'Calle 18', '794', 'Ciudad B', 3, '87654321G'),
	('12345678G', 'Andrés', 'García', 20, 'Calle 13', '127', 'Ciudad A', 1, NULL);


	INSERT INTO Telefono (cedulaCli, telefono)
	VALUES
	('12345678A', '123456789'),
	('87654321B', '987654321'),
	('56781234C', '456789123'),
	('12345678B', '234567890'),
	('87654321C', '876543210'),
	('56781234D', '345678901'),
	('12345678D', '765432109'),
	('87654321E', '456789012'),
	('56781234E', '654321098'),
	('12345678F', '567890123'),
	('87654321F', '543210987'),
	('56781234F', '678901234'),
	('12345678G', '432109876'),
	('87654321G', '789012345'),
	('56781234G', '321098765'),
	('12345678H', '890123456'),
	('87654321H', '210987654'),
	('56781234H', '901234567');


	INSERT INTO Articulo (descripcion, precio, stock)
	VALUES
	('Martillo', 15, 100),
	('Destornillador', 7, 200),
	('Llave Inglesa', 20, 150),
	('Taladro', 50, 80),
	('Sierra', 30, 50);


	INSERT INTO Factura (fechaElaboracion, cedulaCli, codigoVend)
	VALUES
	('2023-01-15', '12345678A', 1),
	('2023-02-10', '87654321B', 2),
	('2023-03-05', '56781234C', 3),
	('2023-04-01', '12345678B', 1),
	('2023-05-20', '87654321C', 2);


	INSERT INTO Detalle (nroFactura, codigo, cantidad)
	VALUES
	(1, 1, 2),
	(2, 2, 1),
	(3, 3, 3),
	(4, 4, 1),
	(5, 5, 2);

	-- PONER ALTER TABLE A VENDEDOR
	ALTER TABLE Vendedor
	ADD CONSTRAINT FK_Vendedor_Cliente FOREIGN KEY (cedulaReco) REFERENCES Cliente(cedulaCli);