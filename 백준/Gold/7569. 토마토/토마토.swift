let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = input[0]
let n = input[1]
let h = input[2]

var queue = [(Int,Int,Int)]()
var box = [[[Int]]](repeating: [[Int]](), count: h)
var map = [[Int]]()
var lastIdx = (0,0,0)
for i in 0..<h {
    for j in 0..<n {
        let temp = readLine()!.split { $0 == " " }.map { Int(String($0))! }
        box[i].append(temp)
        for k in 0..<m {
            if box[i][j][k] == 1 {
                queue.append((i,j,k))
            }
        }
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
let direction = [(0,0,1),(0,0,-1),(-1,0,0),(1,0,0),(0,1,0),(0,-1,0)]

var idx = 0
while idx < queue.count {
    let q = queue[idx]
    idx += 1
    for d in direction {
        let nz = q.0 + d.0
        let nx = q.1 + d.1
        let ny = q.2 + d.2
        
        if nx < 0 || ny < 0 || nz < 0 || nx == n || ny == m || nz == h {
            continue
        }
        
        if box[nz][nx][ny] == 0 {
            box[nz][nx][ny] = box[q.0][q.1][q.2] + 1
            queue.append((nz,nx,ny))
            lastIdx = (nz,nx,ny)
        }
    }
}

var answer = box[lastIdx.0][lastIdx.1][lastIdx.2]
for layer in box {
    for item in layer {
        if item.contains(0) {
            answer = 0
        }
    }
}
print(answer-1)