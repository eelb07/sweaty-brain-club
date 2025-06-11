

-- 개체의 크기를 내림차순으로 정렬 

WITH PERC AS (
    SELECT 
        ID, 
        NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC) as IDX
    FROM 
        ECOLI_DATA 
    )

SELECT 
    ID,
    CASE 
        WHEN IDX = 1 THEN 'CRITICAL'
        WHEN IDX = 2 THEN 'HIGH'
        WHEN IDX = 3 THEN 'MEDIUM'
        WHEN IDX = 4 THEN 'LOW'
    END AS COLONY_NAME
FROM PERC
ORDER BY ID ;