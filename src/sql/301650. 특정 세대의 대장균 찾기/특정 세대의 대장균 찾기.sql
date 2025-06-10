WITH FIR AS (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    ),
    
    SEC AS (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IN ( SELECT * FROM FIR)
    )

SELECT 
    ID
FROM
    ECOLI_DATA
WHERE
    PARENT_ID IN (SELECT * FROM SEC)
ORDER BY 
    ID;

/*
WITH RECURSIVE hierarchy AS (
    -- anchor: 시작 ID와 depth 1부터 시작
    SELECT ID, 1 AS generation
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL

    UNION ALL

    -- 재귀: generation + 1씩 누적
    SELECT e.ID, h.generation + 1
    FROM ECOLI_DATA e
    JOIN hierarchy h ON e.PARENT_ID = h.ID
)

SELECT ID
FROM hierarchy
WHERE generation = 3   -- 3세대만 선택
ORDER BY ID;
*/