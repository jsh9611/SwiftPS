let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = input[0]
let m = input[1]

var map = [[Int]]()
for _ in 0..<n {
    map.append(Array(readLine()!.map{String($0)}).map{Int($0)!})
}
map[0][0] = 2

var queue = [(Int, Int)]()
queue.append((0,0))

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

while !queue.isEmpty {
    let q = queue.removeFirst()
    for i in 0..<4 {
        let nx = q.0 + dx[i]
        let ny = q.1 + dy[i]
        
        if nx < 0 || ny < 0 || nx == n || ny == m {
            continue
        }
        
        if map[nx][ny] == 1 || map[nx][ny] > (map[q.0][q.1] + 1) {
            map[nx][ny] = map[q.0][q.1] + 1
            queue.append((nx,ny))
        }
    }
}

print(map[n-1][m-1] - 1)