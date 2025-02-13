-- Definición de Gatorade_gt_Total_Final
SELECT  
  email,
  original_timestamp,
  evento_pais,
  evento_promocion,
  NULL AS evento_version
FROM mundo_gatorade_web.formulario_enviado
WHERE evento_pais = 'formularioGt'
  AND evento_promocion <> 'formularioMaxTott2025Gt'
  AND NOT (
        EXTRACT(YEAR FROM original_timestamp) = 2025
        AND evento_promocion = 'formularioFutbolGt'
      )

UNION ALL

SELECT 
  email,
  original_timestamp,
  evento_pais,
  'FormularioHome' AS evento_promocion,
  NULL AS evento_version
FROM mundo_gatorade_web.formulario_home_gt
WHERE evento_pais = 'formularioGt'

UNION ALL

SELECT 
  email,
  original_timestamp,
  evento_pais,
  evento_promocion,
  NULL AS evento_version
FROM mundo_gatorade_web.formulario21kgt

UNION ALL

SELECT 
  email,
  original_timestamp,
  evento_pais,
  evento_promocion,
  NULL AS evento_version
FROM mundo_gatorade_web.formulario_carreraMaxTott

UNION ALL

SELECT 
  string_field_0 AS email,
  '2024-06-09 16:43:11.026000 UTC' AS original_timestamp,
  'formularioGt' AS evento_pais,
  string_field_6 AS evento_promocion,
  NULL AS evento_version
FROM mundo_gatorade_web.formulario5V5Gt

UNION ALL
-- Evento agregado el 12/02/2025 (se incluye el campo evento_version)
SELECT 
  string_field_4 AS email,
  PARSE_TIMESTAMP('%F %T', string_field_0) AS original_timestamp, 
  string_field_9 AS evento_pais, 
  string_field_10 AS evento_promocion,
  string_field_12 AS evento_version
FROM mundo_gatorade_web.formulariosGatorade2025
WHERE string_field_10 = "formularioMaxTott2025Gt"

UNION ALL
-- Evento agregado el 12/02/2025 (se incluye el campo evento_version)
SELECT 
  string_field_4 AS email,
  PARSE_TIMESTAMP('%F %T', string_field_0) AS original_timestamp, 
  string_field_9 AS evento_pais, 
  string_field_10 AS evento_promocion,
  string_field_12 AS evento_version
FROM mundo_gatorade_web.formulariosGatorade2025
WHERE string_field_10 = "formularioFutbolGt" 
  AND string_field_12 = "Partidos15y16deFebrero"
