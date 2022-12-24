def solution(k, d):
    def ableY(x, d):
        return int((d**2 - x**2)**(1/2))
    
    answer = 0
    for i in range(0, d+1, k):
        answer += ableY(i,d) // k + 1
    return answer