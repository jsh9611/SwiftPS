let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = input[0]
let n = input[1]

var queue = [(Int, Int)]()
var map = [[Int]]()
var lastIdx = (0,0)
for i in 0..<n {
    let temp = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    map.append(temp)
    for j in 0..<m {
        if map[i][j] == 1 {
            queue.append((i,j))
        }
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

var idx = 0
while idx < queue.count {
    let q = queue[idx]
    idx += 1
    for i in 0..<4 {
        let nx = q.0 + dx[i]
        let ny = q.1 + dy[i]

        if nx < 0 || ny < 0 || nx == n || ny == m {
            continue
        }

        if map[nx][ny] == 0 {
            map[nx][ny] = map[q.0][q.1] + 1
            queue.append((nx,ny))
            lastIdx = (nx,ny)
        }
    }
}

var answer = map[lastIdx.0][lastIdx.1]
for item in map {
    if item.contains(0) {
        answer = 0
        break
    }
}
print(answer-1)