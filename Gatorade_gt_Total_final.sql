SELECT 
  email,
  original_timestamp,
  evento_pais,
  evento_promocion
FROM mundo_gatorade_web.formulario_enviado
WHERE evento_pais = 'formularioGt'
  -- negación del evento promoción para no generar un duplicado en los registros que se obtuvieron automáticamente
  AND evento_promocion <> 'formularioMaxTott2025Gt'

UNION ALL

SELECT 
  email,
  original_timestamp,
  evento_pais,
  'FormularioHome' AS evento_promocion
FROM mundo_gatorade_web.formulario_home_gt
WHERE evento_pais = 'formularioGt'

UNION ALL

SELECT 
  email,
  original_timestamp,
  evento_pais,
  evento_promocion
FROM mundo_gatorade_web.formulario21kgt

UNION ALL

SELECT 
  email,
  original_timestamp,
  evento_pais,
  evento_promocion
FROM mundo_gatorade_web.formulario_carreraMaxTott

UNION ALL

SELECT 
  string_field_0 AS email,
  '2024-06-09 16:43:11.026000 UTC' AS original_timestamp,
  'formularioGt' AS evento_pais,
  string_field_6 AS evento_promocion
FROM mundo_gatorade_web.formulario5V5Gt

UNION ALL
-- Evento agregado el 12/02/2025
SELECT 
  string_field_4 AS email,
  -- Nos ayuda a hacer compatible el formato del Timestamp
  PARSE_TIMESTAMP('%F %T', string_field_0) AS original_timestamp, 
  string_field_9 AS evento_pais, 
  string_field_10 AS evento_promocion 
FROM mundo_gatorade_web.formularioMaxTottGatorade2025
-- Se incluyen ambas promociones; para "formularioFutbolGt" se filtra adicionalmente por evento_version
WHERE string_field_10 = "formularioMaxTott2025Gt"
   OR (string_field_10 = "formularioFutbolGt" AND string_field_12 = "Partidos15y16deFebrero")
