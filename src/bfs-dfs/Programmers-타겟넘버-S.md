
#  타겟넘버

## 🔗 Problem Link  
https://school.programmers.co.kr/learn/courses/30/lessons/43165

## 💡 Approach  
- 주어진 숫자들(`numbers`)을 더하거나 빼서 `target` 값을 만드는 **모든 경우의 수**를 구하는 문제.
- 완전탐색(DFS)을 사용해 각 숫자에 대해 `+`, `-` 두 가지 선택지를 재귀적으로 탐색.
- 인덱스를 따라 끝까지 도달했을 때 누적합이 `target`이면 경우의 수 +1.
- 트리 구조의 DFS 방식으로 문제 해결 가능.

## 🧾 Code  
```python
def solution(numbers, target):
    
    def dfs(index, current_sum):
        if index == len(numbers):
            if current_sum == target:
                return 1
            else:
                return 0
        
        plus = dfs(index + 1, current_sum + numbers[index])
        minus = dfs(index + 1, current_sum - numbers[index])
        
        return plus + minus
    return dfs(0,0)

```

## 🎯 Key Point  
- 각 숫자마다 + 또는 -를 선택해 이진 트리 형태로 탐색.
- 깊이 우선 탐색(DFS) 방식으로 전체 경우의 수를 재귀적으로 탐색.
- 최종적으로 타겟 값과 일치하는 경우만 카운트.
- 시간복잡도는 O(2^n)으로, `numbers` 길이가 20 이하이므로 충분히 가능.

## 📚 What I Learned  
- 간단한 재귀 호출로 완전탐색을 구현할 수 있음을 체감.
- 백트래킹보다는 **모든 경우를 보는 완전탐색**이 더 적합한 문제.
- DFS 구조에서 조건이 만족되는 경우만 세면 문제 해결 가능.

## ✅ DFS 
- **함수 정의**: `dfs(index, sum)` 형태로 현재 인덱스와 누적 합을 매개변수로 넘김.
- **재귀 함수가 멈추는 조건(기저조건)**: 모든 숫자를 다 사용했을 때(`index == len(numbers)`), 누적 합이 타겟과 같으면 1 반환.
- **재귀 호출**: 현재 숫자를 더한 경우와 뺀 경우 두 가지 모두 재귀적으로 호출.
- **결과 누적**: 두 경우의 반환값을 더하여 전체 경우의 수를 계산.