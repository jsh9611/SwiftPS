import Foundation

func solution(_ n:Int) -> [[Int]] {
    
    var answer = [[Int]]()
    
    func hanoi(_ n: Int, from a: Int, to b: Int) {
        if n == 1 {
            answer.append([a,b])
            return
        }

        hanoi(n-1, from: a, to: 6-a-b)
        answer.append([a,b])
        hanoi(n-1, from: 6-a-b, to: b)
    }
    
    hanoi(n, from: 1, to: 3)
    return answer
}
