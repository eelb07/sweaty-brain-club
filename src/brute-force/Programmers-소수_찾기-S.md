
#  소수 찾기 

## 🔗 Problem Link  
https://school.programmers.co.kr/learn/courses/30/lessons/42839

## 💡 Approach  
1. 문자열의 모든 순열 조합을 구한다.
2. 각 조합을 정수로 만들고, 중복을 제거한다. 
3. 각 정수가 소수인 지 판별한다. 
4. 개수 반환 



## 🧾 Code  
```python
from itertools import permutations

def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True
    
def solution(numbers):
    num_set = set()
    
    # 모든 길이의 순열 생성
    # permutation 함수에 길이를 넘겨줘야 하니까 
    for r in range(1, len(numbers) + 1):
        for perm in permutations(numbers, r):
            num = int(''.join(perm)) # 리스트 형태로 조합 결과가 나옴
            num_set.add(num)
            
    count = 0
    for num in num_set:
        if (is_prime(num)):
            count += 1 
            
    return count
            
```

## 🎯 Key Point  

## 📚 What I Learned  
- permutation (순열) 내장함수를 사용하여 문자 조합의 모든 경우의 수를 확인
- 중복 제거를 위해 set에 add