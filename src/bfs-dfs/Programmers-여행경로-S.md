# 여행 경로

## 🔗 Problem Link  
https://school.programmers.co.kr/learn/courses/30/lessons/43164

## 💡 Approach  
- 주어진 항공권들을 모두 사용해서 "ICN"부터 시작하는 **유효한 여행 경로**를 구하는 문제.
- 조건:
  - 모든 티켓을 **정확히 한 번씩** 사용해야 함.
  - 가능한 경로가 여러 개면, **사전순으로 가장 빠른 경로**를 반환해야 함.
- DFS를 사용하여 모든 가능한 경로를 탐색하고, 그 중 정답 조건을 만족하는 경로들을 모아 `sorted()`로 사전순 정렬 후 가장 앞의 결과를 반환.


## 🧾 Code  
```python
# def solution(tickets):
#     tickets.sort()
#     visited = [False] * len(tickets)
#     answer = []
    
#     def dfs(path, depth):
#         if depth == len(tickets):
#             answer.append(path[:])
#             return True
        
#         for i in range(len(tickets)):
#             if not visited[i] and path[-1] == tickets[i][0]:
#                 visited[i] = True
#                 if dfs(path + [tickets[i][1]], depth + 1):
#                     return True
#                 visited[i] = False
        
#         return False
    
#     dfs(["ICN"], 0)
#     return answer[0]

def solution(tickets):
    
    tickets.sort()
    answer = []
    
    def dfs(curr, path, used):
        if len(path) == len(tickets) + 1:
            answer.append(path)
            return
        
        for i in range(len(tickets)):
            if not used[i] and tickets[i][0] == curr:
                used[i] = True
                dfs(tickets[i][1], path + [tickets[i][1]], used)
                used[i] = False
        
    dfs("ICN", ["ICN"], [False]*len(tickets))
    
    return sorted(answer)[0]
    

```

## 🎯 Key Point  

## 📚 What I Learned  
