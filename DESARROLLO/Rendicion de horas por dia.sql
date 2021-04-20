-- procedimiento para rendir hs por proyecto
delimiter $$
CREATE PROCEDURE rendicion_hs_dia(partic INT ,proyect INT ,horas INT,fech DATE)

BEGIN
	
	INSERT INTO asignacion_hs (id_part,id_proy,cant_horas,fecha) 
	VALUES (partic,proyect,horas,fech);

END;
$$