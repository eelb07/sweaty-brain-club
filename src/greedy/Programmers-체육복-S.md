
#  체육복

## 🔗 Problem Link  
https://school.programmers.co.kr/learn/courses/30/lessons/42862

## 💡 Approach  
- 일관된 로직대로 체육복을 빌려주기. 하나하나의 선택이 최적으로 이어짐. 여분의 체육복이 있는 경우, 왼쪽부터 살펴서 없는 경우 주고, 왼쪽 아이가 있다면 오른쪽 아이를 살펴서 필요하다면 빌려준다. N을 ASC로 순회하며 1. 왼쪽 아이 2. 오른쪽 아이 순서대로 똑같이 비교하는게 체육복을 가장 많이 입을 수 있는 방법임. 

## 🧾 Code  
```python

def solution(n, lost, reserve):
    sh = [1] * (n+2)

    for i in reserve:
        sh[i] += 1
    for i in lost:
        sh[i] -= 1

    for i in range(1, n+1):
        if sh[i] == 2 and sh[i-1] == 0:  # 여유분이 있다면 앞에 애 확인
            sh[i-1:i+1] = [1,1]
        elif sh[i] == 2 and sh[i+1] == 0:  # 뒤에 확인 
            sh[i:i+2] = [1,1]
    answer = 0
    for i in range(1, i+1):
        if sh[i] >= 1:
            answer += 1
        
    return answer  

```

## 🎯 Key Point  
- 어떻게 하면 효율적으로 빌려줄까에 대한 고민. 동일한 로직으로 나누어주기

## 📚 What I Learned  
- `sh = [1] * ( i + 2)`
- `sh[i:i*2] = [1, 1]` 🌟🌟🌟 슬라이싱으로 리스트 구역 값 지정하기
-> `sh[i:i+n] = [값1, 값2, ..., 값n]`