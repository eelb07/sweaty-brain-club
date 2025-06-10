WITH SK_FLAG AS (
        SELECT
            ID,
            EMAIL,
            CASE 
                WHEN SKILL_CODE & (
                    SELECT SUM(CODE) AS TOTAL_FRONT
                    FROM SKILLCODES
                    WHERE CATEGORY = 'Front End') > 0 THEN 1
                ELSE 0
            END AS FRONT_FLAG,
            CASE 
                WHEN SKILL_CODE & (
                    SELECT CODE AS TOTAL_FRONT
                    FROM SKILLCODES
                    WHERE NAME = 'Python') > 0 THEN 1
                ELSE 0
            END AS PYTHON_FLAG,
            CASE 
                WHEN SKILL_CODE & (
                    SELECT CODE AS TOTAL_FRONT
                    FROM SKILLCODES
                    WHERE NAME = 'C#') > 0 THEN 1
                ELSE 0
            END AS C_FLAG
            
        FROM 
            DEVELOPERS
)

SELECT 
    CASE
        WHEN FRONT_FLAG = 1 AND PYTHON_FLAG = 1 THEN 'A'
        WHEN C_FLAG = 1 THEN 'B'
        WHEN FRONT_FLAG = 1 THEN 'C'
    END AS GRADE,
    ID,
    EMAIL
        
FROM SK_FLAG
WHERE (FRONT_FLAG = 1 AND PYTHON_FLAG = 1)
   OR C_FLAG = 1
   OR FRONT_FLAG = 1

ORDER BY 
    GRADE, ID
;