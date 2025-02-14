-- Definición de Pepsi_gt_Total_Final
SELECT
  email,
  original_timestamp, 
  evento_promocion,
  evento_pais
FROM `mundo_pepsi_web.formulario_enviado`
WHERE evento_pais = 'formularioGt'
   -- Excluir los registros con evento_promocion = 'formularioMariaBecerraGt' asignados desde formulario_enviado
  AND evento_promocion <> 'formularioMariaBecerraGt'
  -- Excluir los registros con evento_promocion = 'formularioHinchaPepsiGt' para el año 2025
  AND NOT (
        EXTRACT(YEAR FROM original_timestamp) = 2025
        AND evento_promocion = 'formularioHinchaPepsiGt'
      )

UNION ALL

SELECT
  email,
  original_timestamp,
  evento_promocion,
  evento_pais
FROM `mundo_pepsi_web.formulario_karol_g`

UNION ALL

SELECT
  email,
  original_timestamp,
  'fomularioLuisMiguelGt' AS evento_promocion,
  evento_pais
FROM `mundo_pepsi_web.formulario_luis_miguel_gt`

UNION ALL

SELECT
  email,
  original_timestamp,
  evento_promocion,
  evento_pais
FROM `mundo_pepsi_web.formulario_nicki_nicole`

UNION ALL

SELECT
  email,
  original_timestamp,
  evento_promocion,
  evento_pais
FROM `mundo_pepsi_web.formulario_gr24pr`

UNION ALL

SELECT
  email,
  original_timestamp,
  evento_promocion,
  evento_pais
FROM `mundo_pepsi_web.formulario_home_gt`

UNION ALL

SELECT
  email,
  '2024-01-24 15:15:13.098000 UTC' AS original_timestamp,
  evento_promocion, 
  evento_pais
FROM `mundo_pepsi_web.formulario_luis_miguel_gt_total`

UNION ALL

SELECT
  email,
  original_timestamp,
  evento_promocion,
  evento_pa_s AS evento_pais
FROM `hyperreality_ferxxo_pepsi.identifies`

UNION ALL
-- Eventos agregados el 13/02/2025: formularioMariaBecerraGt
SELECT 
  string_field_4 AS email,
  -- Convierte el string al tipo TIMESTAMP usando el patrón para este formato (sin microsegundos ni zona)
  PARSE_TIMESTAMP('%F %T', string_field_0) AS original_timestamp, 
  string_field_8 AS evento_promocion,
  string_field_7 AS evento_pais
FROM mundo_pepsi_web.formulariosPepsi2025
WHERE string_field_8 = "formularioMariaBecerraGt"

UNION ALL
-- Eventos agregados el 13/02/2025: formularioHinchaPepsiGt
SELECT 
  string_field_4 AS email,
  PARSE_TIMESTAMP('%F %T', string_field_0) AS original_timestamp, 
  string_field_8 AS evento_promocion,
  string_field_7 AS evento_pais
FROM mundo_pepsi_web.formulariosPepsi2025
WHERE string_field_8 = "formularioHinchaPepsiGt";
