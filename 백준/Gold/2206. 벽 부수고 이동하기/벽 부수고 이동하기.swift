let nm = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = nm[0]
let m = nm[1]

var map = [[Int]]()
var wall = [(Int,Int)]()
for _ in 0..<n {
    map.append(Array(readLine()!).map{ Int(String($0))! })
}

func bfs() -> Int {
    var queue = [(0,0,0)]
    var idx = 0
    var time = 0
    map[0][0] = 2
    while idx < queue.count {
        time += 1
        for _ in idx..<queue.count {
            let q = queue[idx]
            let x = q.0, y = q.1, superPass = q.2
            idx += 1
            if (x,y) == (n-1,m-1) {
                return time
            }
            
            for d in [(0,1),(0,-1),(1,0),(-1,0)] {
                let nx = q.0 + d.0
                let ny = q.1 + d.1
                
                if nx < 0 || ny < 0 || nx == n || ny == m {
                    continue
                }
                
                if superPass == 0 {
                    if map[nx][ny] == 0 {
                        map[nx][ny] = 2
                        queue.append((nx,ny,0))
                    } else if map[nx][ny] == 1 {
                        queue.append((nx,ny,1))
                    } else if map[nx][ny] == 3 {
                        map[nx][ny] = 2
                        queue.append((nx,ny,0))
                    }
                } else {
                    if map[nx][ny] == 0 {
                        map[nx][ny] = 3
                        queue.append((nx,ny,1))
                    }
                }
            }
        }
    }
    return -1
}

print(bfs())