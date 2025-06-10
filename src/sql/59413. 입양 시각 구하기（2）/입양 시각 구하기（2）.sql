-- 먼저 0~23까지 시간대 생성 (MySQL 기준)
WITH RECURSIVE HOURS_T AS (
    SELECT 0 AS HOUR
    
    UNION ALL
    
    SELECT HOUR + 1 
    FROM HOURS_T 
    WHERE HOUR < 23
)

SELECT 
    H.HOUR,
    IFNULL(A.CNT, 0) AS COUNT
FROM HOURS_T H
LEFT JOIN (
    SELECT 
        HOUR(DATETIME) AS HOUR, 
        COUNT(*) AS CNT
    FROM 
        ANIMAL_OUTS
    GROUP BY 
        HOUR(DATETIME)
) A
ON H.HOUR = A.HOUR
ORDER BY H.HOUR;

/*
WITH RECURSIVE cte_name AS (
    -- ① anchor part (초기값)
    SELECT initial_value

    UNION ALL

    -- ② recursive part (반복)
    SELECT next_value
    FROM cte_name
    WHERE 종료조건
)
SELECT * FROM cte_name;

*/