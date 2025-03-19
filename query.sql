SELECT
prd_id,
prd_key,
REPLACE(SUBSTRING(prd_key, 1, 5), '-','_') AS cat_id,
SUBSTRING(prd_key,7,LEN(prd_key)) AS prd_key,
prd_nm,
ISNULL (prd_cost, 0) AS prd_cost,
prd_line,
CASE WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
    WHEN UPPER(TRIM(prd_line)) = 'R'  THEN 'Road'
    WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'Other Sales'
    WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
    ELSE 'n/a'
END AS prd_line,
prd_start_dt,
prd_end_dt
FROM bronze.crm_prd_info

SELECT * FROM bronze.crm_prd_info
WHERE prd_start_dt > prd_end_dt