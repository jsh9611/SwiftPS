import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    let n = board.count
    let direction = [(-1,0), (0, 1), (1, 0), (0, -1)]  // 하0, 우1, 상2, 좌3
    var score = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    
    var answer = Int.max
    func dfs(_ x: Int, _ y: Int, _ cost: Int,_ prev: Int) {
        
        if board[x][y] == 1 || cost > score[x][y] {
            return
        }
        
        score[x][y] = cost
        
        
        for idx in 0..<4 {
            
            let nx = x + direction[idx].0
            let ny = y + direction[idx].1
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n {
                continue
            }
            
            if prev == idx {
                dfs(nx, ny, cost+100, idx)
            } else {
                dfs(nx, ny, cost+600, idx)
            }
        }
        
    }
    score[0][0] = 0
    dfs(0, 1, 100, 1)
    dfs(1, 0, 100, 2)

    return score[n-1][n-1]
}