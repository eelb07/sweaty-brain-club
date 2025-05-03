# 단어 변환

## 🔗 Problem Link  
https://school.programmers.co.kr/learn/courses/30/lessons/43163

## 💡 Approach  
- begin에서 target으로 변환하는 **최소 단계 수**를 구하는 문제로, **최단 거리 탐색**에 해당.
- 각 단어를 노드로 보고, **한 글자만 다른 단어들끼리 간선으로 연결된 그래프**를 구성한다고 가정.
- BFS를 사용하여 변환 과정을 탐색하고, 가장 먼저 target에 도달했을 때의 단계 수를 반환.
- 변환 가능한 단어인지 확인하기 위해, 두 단어 간 다른 알파벳의 개수를 세는 `is_available()` 함수를 사용.

## 🧾 Code  
```python
from collections import deque

def is_available(word1, word2):
    diff = 0 
    for a, b in zip(word1, word2):
        if a != b :
            diff += 1
        if diff > 1:
            return False
    return diff == 1

def solution(begin, target, words):
    
    if target not in words:
        return 0
    
    visited = set()
    queue = deque()
    queue.append((begin, 0))
    
    while queue:
        curr, step = queue.popleft()
        if curr == target:
            return step
        
        for word in words:
            if word not in visited and is_available(curr, word):
                visited.add(word)
                queue.append((word, step+1))
    
    return 0
```

## 🎯 Key Point  
- **BFS 사용 이유**: 최단 경로 문제는 DFS가 아닌 BFS가 적합. 먼저 도달한 경로가 곧 최소 단계.
- `is_available()` 함수로 **두 단어가 변환 가능한지 판단** (한 글자만 다른지 확인).
- `visited` 집합을 통해 **중복 방문 방지**.
- target이 words에 없으면, 애초에 변환 불가능 → 예외 처리로 `0` 반환.

## 📚 What I Learned  
- 문자열을 `zip(str1, str2)`으로 묶으면 문자 단위로 쌍(pair)을 비교할 수 있다는 점 → 알파벳 단위 비교가 간편해짐.
- `set` 자료형에는 `.add()`를 사용해야 하며, `.append()`는 `list` 전용=
- 큐에 데이터를 넣을 때 `(word, step)`처럼 **튜플 형태로 enqueue**하면, BFS 과정에서 **단계 정보와 단어 상태를 동시에 관리**할 수 있어 유용
