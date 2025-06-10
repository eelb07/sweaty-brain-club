-- 우유와 요거트를 동시에 


WITH TEMP AS (
    SELECT 
        CART_ID,
        COUNT(DISTINCT NAME) AS N_COUNT
    FROM
        CART_PRODUCTS
    WHERE
        NAME IN ("Milk", "Yogurt")
    GROUP BY 
        CART_ID

)

SELECT 
    CART_ID
FROM TEMP
WHERE N_COUNT = 2
ORDER BY CART_ID

;