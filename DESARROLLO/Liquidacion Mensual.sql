-- procedimiento para liquidar protecto
delimiter $$
CREATE PROCEDURE liquidacion_mesual_modificada_valor()

BEGIN
	
	INSERT INTO liquidacion_hs (id_part,id_proy,cant_hs_totales,valor_roll) 
	SELECT id_part 'participante',id_proy 'Proyecto',sum(cant_horas)'Total Hora',valor_roll 'valor'
	FROM asignacion_hs
	GROUP BY id_part,id_proy;	

END;
$$


CALL liquidacion_mesual_modificada;

SELECT * FROM liquidacion_hs;

SELECT * FROM participante;


ALTER TABLE participante
ADD valor_roll DOUBLE;


ALTER TABLE liquidacion_hs
ADD valor_roll DOUBLE;


UPDATE participante
SET valor_roll = 100
WHERE rol = 'Administrador General';

UPDATE participante
SET valor_roll = 80
WHERE rol = 'Desarrollador';

UPDATE participante
SET valor_roll = 60
WHERE rol = 'Analista QA Tester';

UPDATE participante
SET valor_roll = 40
WHERE rol = 'Proyect Manager';

ALTER TABLE liquidacion_hs ADD CONSTRAINT
FOREIGN KEY (valor_roll) REFERENCES participante (valor_roll);