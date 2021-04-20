-- procedimiento para rendir hs por semana de proyecto
delimiter $$
CREATE PROCEDURE rendicion_hs_semana_modificada
(id_participante INT,id_proyecto INT,dia1 INT)

BEGIN

	DECLARE fecha DATETIME DEFAULT CURRENT_TIMESTAMP;
	DECLARE semana INT;
	SET semana = 0;
	while semana < 5 do
	SET fecha = (DATE_ADD(fecha,INTERVAL 1 DAY));
   INSERT INTO asignacion_hs (id_part,id_proy,cant_horas,fecha) VALUES (id_participante,id_proyecto,dia1,fecha);
	SET semana = semana + 1;
	
END while;
END;
$$


CALL rendicion_hs_semana_modificada (1,3,7);


SELECT * FROM  asignacion_hs;

DROP PROCEDURE rendicion_hs_semana_modificada;