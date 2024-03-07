import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var answer = 0
    var visited = [Bool](repeating: false, count: info.count)
    
    func dfs(_ sheep: Int, _ wolf: Int) {
        if sheep <= wolf {
            return
        }
        
        answer = max(answer, sheep)
        
        for edge in edges {
            let parent = edge[0]
            let child = edge[1]
            
            if visited[parent] && !visited[child] {
                visited[child] = true
                
                if info[child] == 0 {
                    dfs(sheep+1, wolf)
                } else {
                    dfs(sheep, wolf+1)
                }
                
                visited[child] = false
            }
        }
    }
    
    visited[0] = true
    dfs(1, 0)
    
    return answer
}