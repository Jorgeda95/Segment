SELECT
email,
original_timestamp, 
evento_promocion,
evento_pais
FROM `mundo_pepsi_web.formulario_enviado`
WHERE evento_pais = 'formularioEc'
-- Excluir los registros con evento_promocion = 'formularioSanValentinEc' y 'formularioUefaEc' para el año 2025
  AND evento_promocion <> 'formularioSanValentinEc'
  AND NOT (
        EXTRACT(YEAR FROM original_timestamp) = 2025
        AND evento_promocion = 'formularioUefaEc'
      )
UNION ALL
-- Eventos agregados el 20/02/2025: formularioSanValentinEc
SELECT 
  string_field_4 AS email,
  PARSE_TIMESTAMP('%F %T', string_field_0) AS original_timestamp, 
  string_field_8 AS evento_promocion,
  string_field_7 AS evento_pais
FROM mundo_pepsi_web.formulariosPepsi2025
WHERE string_field_8 = "formularioSanValentinEc";
UNION ALL
-- Eventos agregados el 20/02/2025: formularioSanValentinEc
SELECT 
  string_field_4 AS email,
  PARSE_TIMESTAMP('%F %T', string_field_0) AS original_timestamp, 
  string_field_8 AS evento_promocion,
  string_field_7 AS evento_pais
FROM mundo_pepsi_web.formulariosPepsi2025
WHERE string_field_8 = "formularioUefaEc";
