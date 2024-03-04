import Foundation

func solution(_ grid:[String]) -> [Int] {
    let grid = grid.map{ Array($0) }
    let dirs = [(0, 1), (1, 0), (0, -1), (-1, 0)]   // 우 하 좌 상

    let (r, c) = (grid.count, grid[0].count)
    
    // Row, Col, Dir 에 대한 방문처리
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 4), count: c), count: r)
    var answer = [Int]()
    
    func dfs(_ i: Int, _ j: Int, _ d: Int, _ count: Int) -> Int {
        if visited[i][j][d] {
            return count
        }
        
        visited[i][j][d] = true

        var nd = d
        if grid[i][j] == "R" {
            nd += 1
        } else if grid[i][j] == "L" {
            nd -= 1
        }
        nd = (nd + 4) % 4
        
        let ni = (i + dirs[nd].0 + r) % r
        let nj = (j + dirs[nd].1 + c) % c

        return dfs(ni, nj, nd, count+1)
    }
    
    for i in 0..<r {
        for j in 0..<c {
            for d in 0..<4 {
                if !visited[i][j][d] {
                    answer.append(dfs(i, j, d, 0))
                }
            }
        }
    }

    return answer.sorted()
}