------------------------- VISTA HOJAS DE TRABAJO SOCIAL ------------------------
CREATE OR REPLACE VIEW VistaHojaTrabajoSocial
AS
SELECT
h.ID_TS
,h.DESCRIPCION
,c.ID_CENTRO_MEDICO
,c.NOMBRE as centro_medico
,t.DESCRIPCION as tipo_centro_medico
,h.FECHA
,e.ID_EXPEDIENTE
,p.P_NOMBRE
,p.S_NOMBRE
,p.P_APELLIDO
,p.S_APELLIDO
,p.NO_IDENTIDAD
,p.SEXO
FROM HOJATRABAJOSOCIAL h
INNER JOIN CENTROMEDICO c
  ON h.ID_CENTRO_MEDICO = c.ID_CENTRO_MEDICO
INNER JOIN TIPOCENTRO t
  ON t.ID_TIPO_CENTRO = c.ID_TIPO_CENTRO
INNER JOIN EXPEDIENTE e
  ON e.ID_EXPEDIENTE = h.ID_EXPEDIENTE
INNER JOIN PACIENTE pa
  ON pa.ID_PACIENTE = e.ID_PACIENTE
INNER JOIN PERSONA p
  ON p.ID_PERSONA = pa.ID_PERSONA
;

----------------------- CONSULTAS

-- listarTodos /*Por centro*/
SELECT
  *
FROM VistaHojaTrabajoSocial h
WHERE
  h.id_expediente = 1
  AND h.id_centro_medico = 1
;

-- listarPorPaciente
SELECT
  *
FROM VistaHojaTrabajoSocial h
WHERE
  h.id_expediente = 1
;

--eliminar
DELETE FROM HOJATRABAJOSOCIAL
WHERE ID_TS = 1;