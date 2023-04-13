import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Set<Int>()
    var answer = 0
    
    func dfs(_ i: Int) {
        for j in 0..<n {
            if !visited.contains(j), computers[i][j] == 1 {
                visited.insert(j)
                dfs(j)
            }
        }
    }
    
    for i in 0..<n {
        if !visited.contains(i) {
            visited.insert(i)
            answer += 1
            dfs(i)
        }
    }
    
    return answer
}