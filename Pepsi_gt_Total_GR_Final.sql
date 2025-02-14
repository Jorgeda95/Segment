WITH RankedEmails AS (
  SELECT 
    email, 
    original_timestamp,  
    evento_promocion, 
    evento_pais,
    ROW_NUMBER() OVER(PARTITION BY email ORDER BY original_timestamp ASC) AS rn
  FROM `mundo_pepsi_web.Pepsi_gt_Total_Final`
),
GoldenRecords AS (
  SELECT 
    email AS email_gr,
    original_timestamp, 
    evento_promocion AS evento_goldenr,
    evento_pais
  FROM RankedEmails
  WHERE rn = 1
)
SELECT 
  pgt.email,
  pgt.original_timestamp,
  pgt.evento_promocion,
  pgt.evento_pais,
  gr.email_gr,
  gr.evento_goldenr
FROM `mundo_pepsi_web.Pepsi_gt_Total_Final` pgt
LEFT JOIN GoldenRecords AS gr
  ON pgt.email = gr.email_gr 
  AND pgt.original_timestamp = gr.original_timestamp;
