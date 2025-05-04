
# 카펫

## 🔗 Problem Link  
https://school.programmers.co.kr/learn/courses/30/lessons/42842

## 💡 Approach  
- 총 높이 별로 가능한 조합을 모두 탐색하는 것 


## 🧾 Code  
```python
def solution(brown, yellow):
    answer = []
    total = brown + yellow
    
    for i in range(3, total):
        if (total % i == 0):
            w = total // i
            if (i - 2) * (w -2) == yellow:
                return [w, i]

```

## 🎯 Key Point  
-  (i - 2) * (w -2) 가 안의 면적의 식이라는 걸 알면....

## 📚 What I Learned  
