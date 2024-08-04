
-- TABLAS SIN FOREIGN KEY

CREATE TABLE Vendedor (
    codigoVend INT AUTO_INCREMENT PRIMARY KEY,
    nombreVend VARCHAR(50),
    apellidoVend VARCHAR(50),
    sexoVend CHAR(1),
    telefonoVend VARCHAR(20),
    fechaContrato DATE,
    cedulaReco VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Cliente (
    cedulaCli VARCHAR(20) PRIMARY KEY,
    nombreCli VARCHAR(50),
    apellidoCli VARCHAR(50),
    limiteCredito DECIMAL(10, 2),
    calle VARCHAR(50),
    nro VARCHAR(10),
    ciudad VARCHAR(50),
    codigoVend INT,
    cedulaReco VARCHAR(20),
    FOREIGN KEY (codigoVend) REFERENCES Vendedor(codigoVend),
    FOREIGN KEY (cedulaReco) REFERENCES Cliente(cedulaCli)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Factura (
    nroFactura INT AUTO_INCREMENT PRIMARY KEY,
    fechaElaboracion DATE,
    cedulaCli VARCHAR(20),
    codigoVend INT,
    FOREIGN KEY (cedulaCli) REFERENCES Cliente(cedulaCli),
    FOREIGN KEY (codigoVend) REFERENCES Vendedor(codigoVend)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Articulo (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100),
    precio DECIMAL(10, 2),
    stock INT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Detalle (
    nroFactura INT,
    codigo INT,
    cantidad INT,
    PRIMARY KEY (nroFactura, codigo),
    FOREIGN KEY (nroFactura) REFERENCES Factura(nroFactura),
    FOREIGN KEY (codigo) REFERENCES Articulo(codigo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Telefono (
    cedulaCli VARCHAR(20),
    telefono VARCHAR(20),
    FOREIGN KEY (cedulaCli) REFERENCES Cliente(cedulaCli)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Familiar (
    codigoVend INT,
    nombre VARCHAR(50),
    fechaNac DATE,
    parentesco VARCHAR(50),
    sexo CHAR(1),
    FOREIGN KEY (codigoVend) REFERENCES Vendedor(codigoVend)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- PONER ALTER TABLE A LAS TABLAS CON FOREING KEY

ALTER TABLE Vendedor
ADD CONSTRAINT FK_Vendedor_Cliente
FOREIGN KEY (cedulaReco) REFERENCES Cliente(cedulaCli);
