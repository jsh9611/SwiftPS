import Foundation

func solution(_ maps:[String]) -> [Int] {
    let n = maps.count
    let m = maps[0].count
    
    var grid: [[Int]] = []
    for map in maps {
        let lane = Array(map)
        grid.append(lane.map{ Int(String($0)) ?? 0 })
    }
    
    func dfs(_ x: Int, _ y: Int, _ cnt: Int) -> Int {
        if x<0 || x>=n || y<0 || y>=m || grid[x][y]<=0 { return cnt }
        
        var island = cnt + grid[x][y]
        grid[x][y] = 0
        
        for dir in [(0,1),(0,-1),(1,0),(-1,0)] {
            island = dfs(x+dir.0, y+dir.1, island)
        }
        
        return island
    }
    
    var answer: [Int] = []
    for i in 0..<n {
        for j in 0..<m {
            if grid[i][j] > 0 {
                answer.append(dfs(i, j, 0))
            }
        }
    }
    
    answer.sort(by: <)
    return answer.isEmpty ? [-1] : answer
}