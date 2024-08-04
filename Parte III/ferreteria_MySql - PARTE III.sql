DELIMITER //

-- CREAR FUNCION
CREATE FUNCTION CalcularAntiguedad(codigoVend INT) 
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE antiguedad INT;
    SET antiguedad = TIMESTAMPDIFF(YEAR, 
	(SELECT fechaContrato FROM Vendedor WHERE codigoVend = codigoVend LIMIT 1), CURDATE());
    RETURN antiguedad;
END //

-- CREAR PROCEDIMIENTO ALMACENADO
CREATE PROCEDURE InsertarFactura(
    IN p_fechaElaboracion DATE, 
    IN p_cedulaCli VARCHAR(20), 
    IN p_codigoVend INT, 
    IN p_codigoArticulo INT, 
    IN p_cantidad INT
)
	BEGIN
		DECLARE ultimaFactura INT;
		
		START TRANSACTION;
		
		INSERT INTO Factura (fechaElaboracion, cedulaCli, codigoVend) 
		VALUES (p_fechaElaboracion, p_cedulaCli, p_codigoVend);
		
		SET ultimaFactura = LAST_INSERT_ID();
		
		INSERT INTO Detalle (nroFactura, codigo, cantidad) 
		VALUES (ultimaFactura, p_codigoArticulo, p_cantidad);
		
		COMMIT;
END //

-- CREAR TRIGGER
CREATE TRIGGER ActualizarStock 
AFTER INSERT ON Detalle
FOR EACH ROW
BEGIN
    UPDATE Articulo 
    SET stock = stock - NEW.cantidad 
    WHERE codigo = NEW.codigo;
END //


DELIMITER ;

-- CREAR VISTA
CREATE VIEW ResumenFacturas AS 
SELECT f.nroFactura, c.nombreCli, c.apellidoCli, v.nombreVend, v.apellidoVend, 
       (SELECT SUM(a.precio * d.cantidad) 
        FROM Detalle d 
        JOIN Articulo a ON d.codigo = a.codigo 
        WHERE d.nroFactura = f.nroFactura) AS subtotal
FROM Factura f
JOIN Cliente c ON f.cedulaCli = c.cedulaCli
JOIN Vendedor v ON f.codigoVend = v.codigoVend;
