import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    var answer : [Int] = []
    let dx = [0, -1, 0, 1]
    let dy = [1, 0, -1, 0]
    
    for place in places {
        var info : [[String]] = []
        var check = Array(repeating: Array(repeating : 0, count: 5), count: 5)
        
        for i in 0..<5 {
            info.append(place[i].map { String($0) })
        }
        
        for i in 0..<5 {
            for j in 0..<5 {
                if info[i][j] == "P" {
                    check[i][j] -= 1
                    
                    for k in 0..<4 {
                        let nx = i + dx[k]
                        let ny = j + dy[k]
                        if (0..<5).contains(nx) && (0..<5).contains(ny) {
                            if check[ i+dx[k] ][ j+dy[k] ] >= 1000 { continue }
                            check[ i+dx[k] ][ j+dy[k] ] -= 1
                        }
                    }
                } else if info[i][j] == "X" {
                    check[i][j] = 1000
                }
            }
        }
        
        func keepDistance() -> Bool {
            for i in 0..<5 {
                for j in 0..<5 {
                    if check[i][j] <= -2 {
                        return false
                    }
                }
            }
            return true
        }
        
        answer.append(keepDistance() ? 1 : 0)
    }
    return answer
}
