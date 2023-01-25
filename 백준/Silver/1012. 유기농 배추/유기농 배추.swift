let t = Int(readLine()!)!
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var answer = ""
for _ in 0..<t {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let m = input[0]
    let n = input[1]
    let k = input[2]
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
    
    for _ in 0..<k {
        let temp = readLine()!.split { $0 == " " }.map { Int(String($0))! }
        map[temp[1]][temp[0]] = 1
    }
    
    func dfs(_ x: Int, _ y: Int) {
        map[x][y] = 0
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx == n || ny == m {
                continue
            }
            
            if map[nx][ny] == 1 {
                dfs(nx,ny)
            }
        }
    }
    
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 {
                dfs(i,j)
                count += 1
            }
        }
    }
    answer += "\(count)\n"
}
print(answer)