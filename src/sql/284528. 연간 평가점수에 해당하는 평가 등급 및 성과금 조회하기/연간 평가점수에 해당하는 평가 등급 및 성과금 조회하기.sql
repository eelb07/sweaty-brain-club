-- 사원별 평가 점수별 등급과 성과금 정보 


WITH DIS_T AS (
    SELECT
        EMP_NO, 
        CASE 
            WHEN AVG(SCORE) >= 96 THEN 'S'
            WHEN AVG(SCORE) >= 90 THEN 'A'
            WHEN AVG(SCORE) >= 80 THEN 'B'
            ELSE  "C"
        END AS GRADE,
        CASE 
            WHEN AVG(SCORE) >= 96 THEN 20
            WHEN AVG(SCORE) >= 90 THEN 15
            WHEN AVG(SCORE) >= 80 THEN 10
            ELSE  0
        END AS DIS_PER
    FROM
        HR_GRADE 
    GROUP BY EMP_NO
)

SELECT
    D.EMP_NO,
    E.EMP_NAME,
    D.GRADE,
    (E.SAL * D.DIS_PER/100) AS BONUS
FROM 
    DIS_T D
JOIN
    HR_EMPLOYEES E ON D.EMP_NO = E.EMP_NO
ORDER BY D.EMP_NO