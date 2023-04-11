import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    let n = numbers.count
    var arr = numbers
    var answer = [Int](repeating: -1, count: n+1)
    
    for i in stride(from: n-2, to: -1, by: -1) {
        for j in (i+1)..<n {
            
            if arr[i] < arr[j] {
                answer[i] = arr[j]
                break
            }
            
            if answer[j] == -1 {
                answer[i] = -1
                break
            }
            
            if arr[i] < answer[j] {
                answer[i] = answer[j]
                break
            }
        }
    }
    let _ = answer.removeLast()
    return answer
}