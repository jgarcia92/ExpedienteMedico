------------------------------------ VISTA ------------------------------------
CREATE OR REPLACE VIEW VistaReferencias
AS
WITH GET_CENTRO
AS(
  SELECT
    c.ID_CENTRO_MEDICO,
    p.DESCRIPCION as tipo_centro_medico
  FROM CENTROMEDICO c
  INNER JOIN TIPOCENTRO p
    ON c.ID_TIPO_CENTRO = p.ID_TIPO_CENTRO
),
GET_MEDICO
AS(
  SELECT
    m.ID_MEDICO
    ,p.p_nombre || ' '  || p.s_nombre || ' '  || p.p_apellido || ' '  || p.s_apellido as medico
    ,m.ID_ESPECIALIDAD
    ,e.ESPECIALIDAD
  FROM MEDICO m
  INNER JOIN PERSONA p
    ON m.ID_PERSONA = p.ID_PERSONA
  INNER JOIN ESPECIALIDAD e
    ON m.ID_ESPECIALIDAD = e.ID_ESPECIALIDAD
)
SELECT
  r.ID_REFERENCIA
,r.DESCRIPCION
,r.ID_MEDICO
,(SELECT m.medico FROM GET_MEDICO m WHERE m.ID_MEDICO = r.ID_MEDICO) as medico
,(SELECT ID_CENTRO_MEDICO FROM CENTROMEDICO c WHERE c.ID_CENTRO_MEDICO = r.ID_CENTRO_MEDICO_REMITE) as id_centro_medico_remite
,(SELECT c.tipo_centro_medico FROM GET_CENTRO c WHERE c.ID_CENTRO_MEDICO = r.ID_CENTRO_MEDICO_REMITE) as tipo_centro_medico_remite
,(SELECT NOMBRE FROM CENTROMEDICO c WHERE c.ID_CENTRO_MEDICO = r.ID_CENTRO_MEDICO_REMITE) as centro_medico_remite
,(SELECT ID_CENTRO_MEDICO FROM CENTROMEDICO c WHERE c.ID_CENTRO_MEDICO = r.ID_CENTRO_MEDICO_RECIBE) as id_centro_medico_recibe
,(SELECT c.tipo_centro_medico FROM GET_CENTRO c WHERE c.ID_CENTRO_MEDICO = r.ID_CENTRO_MEDICO_RECIBE) as tipo_centro_medico_recibe
,(SELECT NOMBRE FROM CENTROMEDICO c WHERE c.ID_CENTRO_MEDICO = r.ID_CENTRO_MEDICO_RECIBE) as centro_medico_recibe
,e.ID_EXPEDIENTE
,e.ID_PACIENTE
,per.P_NOMBRE
,per.S_NOMBRE
,per.P_APELLIDO
,per.S_APELLIDO
,per.NO_IDENTIDAD
,per.SEXO
FROM REFERENCIA r
INNER JOIN EXPEDIENTE e
  ON r.ID_EXPEDIENTE = e.ID_EXPEDIENTE
INNER JOIN PACIENTE pa
  ON e.ID_PACIENTE = pa.ID_PACIENTE
INNER JOIN PERSONA per
  ON pa.ID_PERSONA = per.ID_PERSONA
;

-- eliminar
DELETE FROM REFERENCIA
WHERE ID_REFERENCIA = 1;

-- listarPorPaciente
SELECT
  *
FROM VistaReferencias v
WHERE v.ID_PACIENTE=1;

--listarPorCentroRemite
SELECT
  *
FROM VistaReferencias v
WHERE v.id_centro_medico_remite=1;

-- listarRecibidas
SELECT
  *
FROM VistaReferencias v
WHERE v.id_centro_medico_recibe=1;

-- listarPorMedico // POR CENTRO
SELECT
  *
FROM VistaReferencias v
WHERE v.ID_MEDICO =1
AND v.id_centro_medico_remite=2;