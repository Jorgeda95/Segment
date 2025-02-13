WITH RankedEmails AS (
  SELECT 
    email, 
    original_timestamp,  
    evento_promocion, 
    evento_pais,
    evento_version,
    ROW_NUMBER() OVER(PARTITION BY email ORDER BY original_timestamp ASC) AS rn
  FROM mundo_gatorade_web.Gatorade_gt_Total_Final
),
GoldenRecords AS (
  SELECT 
    email AS email_gr,
    original_timestamp, 
    evento_promocion AS evento_goldenr,
    evento_pais,
    evento_version
  FROM RankedEmails
  WHERE rn = 1
)
SELECT 
  pgt.email,
  pgt.original_timestamp,
  pgt.evento_promocion,
  pgt.evento_pais,
  pgt.evento_version,
  gr.email_gr,
  gr.evento_goldenr,
  gr.evento_version AS golden_evento_version
FROM mundo_gatorade_web.Gatorade_gt_Total_v4 pgt 
LEFT JOIN GoldenRecords AS gr
  ON pgt.email = gr.email_gr 
  AND pgt.original_timestamp = gr.original_timestamp
