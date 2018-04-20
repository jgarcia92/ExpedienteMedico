------------------------- VISTA CONSULTA EXTERNA ------------------------
CREATE OR REPLACE VIEW VistaConsultaExterna
AS
SELECT
    CE.*,
    C.ID_CONSULTORIO,
    PI.*,
    CM.ID_CENTRO_MEDICO,
    EX.ID_PACIENTE,
    EX.ID_EXPEDIENTE,
    M.ID_MEDICO,
    CM.NOMBRE,
    CM.TIPOCENTRO,
    TC.DESCRIPCION,
    PE.P_NOMBRE,
    PE.PAPELLIDO
FROM CONSULTAEXTERNA CE
INNER JOIN CONSULTORIO C
  ON C.ID_CONSULTORIO=CE.ID_CONSULTORIO.,
INNER JOIN EXPEDIENTE EX 
  ON EX.ID_EXPEDIENTE=CE.ID_EXPEDIENTE
INNER JOIN MEDICOCONSULTORIO M 
  ON M.ID_MEDICO=CE.ID_MEDICO
INNER JOIN PISO PI
  ON PI.ID_PISO=C.ID_PISO
INNER JOIN EDIFICIO E 
  ON E.ID_EDIFICIO=PI.ID_EDIFICIO
INNER JOIN CENTROMEDICO CM 
  ON CM.ID_CENTRO_MEDICO= E.ID_CENTRO_MEDICO
INNER JOIN TIPOCENTRO TC 
  ON TC.ID_TIPO_CENTRO= CM.ID_TIPO_CENTRO
INNER JOIN PACIENTE PA 
  ON PA.ID_PACIENTE= EX,ID_PACIENTE
INNER JOIN PERSONA PE 
  ON PE.ID_PERSONA= PA.ID_PERSONA

;

----------------------- CONSULTAS

-- listarTodos /*Por centro*/
SELECT
  *
FROM VistaConsultaExterna
;

-- listarPorPaciente
SELECT
  *
FROM VistaConsultaExterna V
WHERE
  V.ID_EXPEDIENTE=123
;


--LISTAR POR CENTRO MEDICO
SELECT*
FROM VistaConsultaExterna V 
WHERE V.ID_CENTRO_MEDICO=1 OR LIKE V.NOMBRE='HOSPITAL ESCUELA%';

--LISTAR POR HOY
SELECT *
FROM VistaConsultaExterna V 
WHERE V.FECHA_HORA= SYSDATE;

-- listarPor MEDICO
SELECT
  *
FROM VistaConsultaExterna V
WHERE
  V.ID_MEDICO = 1
;
-- listar Por CONSULTORIO
SELECT
  *
FROM VistaConsultaExterna V  
WHERE
  V.ID_CONSULTORIO=1
;

--LISTAR POR CENTRO MEDICO FECHA
SELECT*
FROM VistaConsultaExterna
WHERE v.ID_CENTRO_MEDICO=1 AND v.FECHA_HORA= TO_DATE ('27/02/18')
;

--eliminar
DELETE FROM CONSULTAEXTERNA
WHERE ID_CONSULTA = 1;