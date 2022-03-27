import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    let n = absolutes.count
    var result = 0
    
    for i in 0..<n {
        if signs[i] {
            result += absolutes[i]
        } else {
            result -= absolutes[i]
        }
    }
    return result
}
