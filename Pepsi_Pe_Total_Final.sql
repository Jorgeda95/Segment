SELECT
email,
original_timestamp, 
evento_promocion,
evento_pais
FROM `mundo_pepsi_web.formulario_enviado`
WHERE evento_pais = 'formularioPe'
  -- Excluir los registros con evento_promocion = 'formularioRefrescatuRutaPe' para el año 2025
  AND NOT (
        EXTRACT(YEAR FROM original_timestamp) = 2025
        AND evento_promocion = 'formularioRefrescatuRutaPe'
      )

  
UNION ALL
SELECT
email,
'2024-03-22 16:43:11.026000 UTC'AS original_timestamp,
evento_promocion,
evento_pais
FROM `mundo_pepsi_web.formulario_gr24pe`
UNION ALL
SELECT
string_field_3 AS email,
'2024-08-31 16:43:11.026000 UTC' AS original_timestamp,
string_field_9 AS evento_promocion,
string_field_8 AS evento_pais
FROM `mundo_pepsi_web.formularioSamplingRappiPe`
UNION ALL
-- Eventos agregados el 19/02/2025: formularioRefrescatuRutaPe
SELECT 
  string_field_4 AS email,
  PARSE_TIMESTAMP('%F %T', string_field_0) AS original_timestamp, 
  string_field_8 AS evento_promocion,
  string_field_7 AS evento_pais
FROM mundo_pepsi_web.formulariosPepsi2025
WHERE string_field_8 = "formularioRefrescatuRutaPe";
