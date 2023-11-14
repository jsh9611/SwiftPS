let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0]
let M = input[1]

var pool: [[Int]] = []
var visited: [[Bool]] = []

let direction = [(1,0), (0,1), (-1,0), (0,-1)]

var answer = 0

func bfs(_ x: Int, _ y: Int, _ level: Int) {
    var queue: [(Int,Int)] = []
    var index = 0
    
    queue.append((x,y))
        
    var check = true
    var cnt = 1
    
    visited[x][y] = true
    
    while index < queue.count {
        let (x,y) = queue[index]
        index += 1
        
        for (dx,dy) in direction {
            let nx = x + dx
            let ny = y + dy
            
            if nx < 0 || nx > N-1 || ny < 0 || ny > M-1 {
                check = false
                continue
            }
            
            if pool[nx][ny] < level && !visited[nx][ny] {
                visited[nx][ny] = true
                queue.append((nx,ny))
                cnt += 1
            }
        }
    }

    if check {
        answer += cnt
    }
}

for _ in 0..<N {
    pool.append(Array(readLine()!).map{ Int(String($0))! })
}

for water in 2...9 {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

    for i in 0..<N {
        for j in 0..<M {
            if pool[i][j] < water && !visited[i][j] {
                bfs(i, j, water)
            }
        }
    }
}

print(answer)