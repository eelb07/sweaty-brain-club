-- 총 주문량 상위 3개의 맛 

WITH HALF_JUL AS 
    (
        SELECT *
        FROM JULY

        UNION ALL

        SELECT *
        FROM FIRST_HALF   
    )

SELECT 
    FLAVOR
FROM 
    HALF_JUL
GROUP BY 
    FLAVOR
ORDER BY
    SUM(TOTAL_ORDER) DESC
LIMIT 3 ; 