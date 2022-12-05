import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var appleBox = score.sorted()
    var answer = 0
    
    while appleBox.count >= m {
        for _ in 0..<m-1 {
            let _ = appleBox.popLast()
        }
        
        if let lessValue = appleBox.popLast() {
            answer += lessValue
        }
    }
    return answer * m
}
