
#  네트워크

## 🔗 Problem Link  
https://school.programmers.co.kr/learn/courses/30/lessons/43162

## 💡 Approach  
- 컴퓨터들의 연결 상태가 주어진 인접 행렬(Adjacency Matrix) 형태.
- 서로 직접 또는 간접적으로 연결된 컴퓨터들은 하나의 네트워크로 간주.
- 결국, 연결된 컴퓨터들의 집합(Connected Components) 개수를 구하는 문제. ( like 덩어리.. )
- DFS(깊이 우선 탐색)를 사용하여 한 번 방문한 컴퓨터는 다시 방문하지 않도록 처리하고, 전체 컴퓨터를 탐색.
- **DFS를 시작한 횟수가 곧 네트워크의 개수와 같음.**


## 🧾 Code  
```python
def solution(n, computers):
    
    visited = [False] * n 
    
    def dfs(node):
        visited[node] = True
        for i in range(n):
            if not visited[i] and computers[node][i] == 1:
                dfs(i)
    
    count = 0
    for i in range(n):
        if not visited[i]:
            dfs(i)
            count += 1
        
    return count
```

## 🎯 Key Point  
- **인접 행렬**을 순회하면서 연결된 노드를 재귀적으로 탐색 (DFS).
- 이미 방문한 컴퓨터는 건너뛰어 **불필요한 탐색을 방지**.
- DFS가 한 번 수행될 때마다 하나의 네트워크를 모두 탐색하게 되므로, DFS 호출 횟수가 네트워크의 개수.

## 📚 What I Learned  
- 그래프 탐색(DFS)의 대표적인 활용 예제.
- `visited` 배열을 활용할 것 