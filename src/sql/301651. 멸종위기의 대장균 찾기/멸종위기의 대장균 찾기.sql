WITH RECURSIVE TREE AS (
    -- anchor (1세대): 부모가 없는 ID들 (최초 개체)
    SELECT 
        ID, 
        1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL

    UNION ALL

    -- 재귀: 부모를 따라가며 세대 + 1 누적
    SELECT 
        E.ID, 
        T.GENERATION + 1
    FROM ECOLI_DATA E
    JOIN TREE T
    ON E.PARENT_ID = T.ID
),

-- leaf node 판별
LEAF AS (
    SELECT 
        T.ID,
        T.GENERATION
    FROM TREE T
    LEFT JOIN ECOLI_DATA E
    ON T.ID = E.PARENT_ID
    WHERE E.ID IS NULL   -- 자식 없는 노드
)

-- 세대별 leaf node 수 집계
SELECT 
    COUNT(*) AS COUNT,
    GENERATION
FROM LEAF
GROUP BY GENERATION
ORDER BY GENERATION;
