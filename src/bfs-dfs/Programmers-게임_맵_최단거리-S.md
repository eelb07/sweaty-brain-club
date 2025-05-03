
#  게임 맵 최단거리

## 🔗 Problem Link  
https://school.programmers.co.kr/learn/courses/30/lessons/1844

## 💡 Approach  
- `1`은 이동 가능한 칸, `0`은 벽인 2차원 맵에서 `(0, 0)` → `(n-1, m-1)`까지 **최단 거리**를 구하는 문제.
- **최단 거리**이므로 DFS가 아닌 **BFS**를 사용해야 함.
- BFS는 **가장 먼저 도착한 경로가 곧 최단 경로**가 되므로 큐를 활용해 탐색.
- 방문 시에는 기존 맵을 재사용하여 이동 횟수를 누적 (`maps[x][y] + 1`) → 별도의 visited 배열 불필요.

## 🧾 Code  
```python
from collections import deque

def solution(maps):
    n = len(maps)
    m = len(maps[0])
    
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    
    # BFS
    queue = deque()
    queue.append((0,0))
    
    while queue:
        x, y = queue.popleft()
        
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            
            if nx < 0 or ny < 0 or nx >= n or ny >= m :
                continue  # 범위 밖은 무시
            if maps[nx][ny] == 0:
                continue # 벽 밖은 무시 
                
            if maps[nx][ny] == 1: # 처음 방문
                maps[nx][ny] = maps[x][y] + 1  # 더해서 갱신
                queue.append((nx, ny))

    if maps[n-1][m-1] == 1: # 방문 못한 경우 ( 1 그대로 )
        return -1
    else:
        return maps[n-1][m-1]

    # BFS는 큐를 이용하여 가장 먼저 들어간 위치부터 꺼내서 주변을 탐색함
    # 
```

## 🎯 Key Point  
- **BFS는 최단 거리 탐색에 최적화된 알고리즘**.
- 매번 현재 위치에서 갈 수 있는 모든 방향을 탐색하고, 도착지에 도달하면 그 경로가 가장 빠름.
- `maps` 배열 자체를 활용해 거리 누적 → 별도의 visited 리스트가 필요 없음.
- 도착 위치가 `1`이면 도달하지 못한 것 → `-1` 반환.

## 📚 What I Learned  
- DFS는 깊이 우선으로 파고들기 때문에 최단 거리와는 맞지 않음.
- BFS는 **탐색 순서 보장**으로 인해 최단 거리 문제에 유리.
- `maps`를 거리 저장소로 재활용하면서 공간 절약도 가능.
- 탐색 문제에서는 어떤 알고리즘이 적합한지 먼저 판단하는 것이 중요.