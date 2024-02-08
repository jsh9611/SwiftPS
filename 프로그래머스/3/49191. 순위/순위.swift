import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var win = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
    var lose = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
    
    for result in results {
        win[result[0]][result[1]] = true
        lose[result[1]][result[0]] = true
    }
    
    for i in 1...n {
        for j in 1...n {
            for k in 1...n {
                if win[i][k] && win[k][j] {
                    win[i][j] = true
                    lose[j][i] = true
                }
                
                if lose[i][k] && lose[k][j] {
                    win[j][i] = true
                    lose[i][j] = true
                }
            }
        }
    }
    
    var answer = 0
    for i in 1...n {
        var cnt = 0
        for j in 1...n {
            if win[i][j] || lose[i][j] { cnt += 1 }
        }
        
        if cnt == n-1 { answer += 1 }
    }
    
    return answer
}