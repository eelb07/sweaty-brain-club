-- 보호소에 들어올 당시에는 중성화되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요. 

SELECT 
    INS.ANIMAL_ID, INS.ANIMAL_TYPE, INS.NAME
FROM 
    ANIMAL_OUTS AS OUTS
JOIN 
    ANIMAL_INS AS INS
ON 
    OUTS.ANIMAL_ID = INS.ANIMAL_ID   -- inner join (양쪽에 다 존재)
WHERE
    OUTS.SEX_UPON_OUTCOME IN ('Spayed Female', 'Spayed Male', 
                              'Neutered Male', 'Neutered Female')
    AND INS.SEX_UPON_INTAKE IN ('Intact Male', 'Intact Female')
ORDER BY INS.ANIMAL_ID;


/*
WHERE
    (OUTS.SEX_UPON_OUTCOME LIKE 'Spayed%' OR OUTS.SEX_UPON_OUTCOME LIKE 'Neutered%')
    AND INS.SEX_UPON_INTAKE LIKE 'Intact%'
*/ 
-- AND 가 OR 보다 연산자 우선 순위가 높아서, 괄호로 감싼다. 