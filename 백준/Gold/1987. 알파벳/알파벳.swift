let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let r = input[0]
let c = input[1]

var board: [[Int]] = []
for _ in 0..<r {
    board.append(readLine()!.map { Int($0.asciiValue!) - 65 })
}

var answer = 0

func dfs(_ x: Int, _ y: Int, _ count: Int, _ visited: Int) {
    answer = max(answer, count)
    
    for d in [(0,1),(0,-1),(1,0),(-1,0)] {
        let nx = x + d.0
        let ny = y + d.1
        
        if nx < 0 || ny < 0 || nx == r || ny == c {
            continue
        }
        
        let now = 1 << board[nx][ny]
        
        if visited & now == 0 {
            dfs(nx, ny, count+1, visited | now)
        }
    }
}

dfs(0, 0, 1, 1 << board[0][0])
print(answer)