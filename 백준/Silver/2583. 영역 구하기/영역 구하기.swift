let input = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let m = input[0], n = input[1], k = input[2]

var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
for _ in 0..<k {
    let temp = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
    let y1 = temp[0], x1 = temp[1]
    let y2 = temp[2], x2 = temp[3]
    for i in x1..<x2 {
        for j in y1..<y2 {
            map[i][j] = 1
        }
    }
}

func dfs(_ x: Int, _ y: Int, _ cnt: Int) -> Int {
    if x < 0 || y < 0 || x >= m || y >= n || map[x][y] == 1 {
        return cnt
    }
    map[x][y] = 1

    return dfs(x+1,y,cnt+1) + dfs(x-1,y,0) + dfs(x,y+1,0) + dfs(x,y-1,0)
}

var answer = [Int]()

for i in 0..<m {
    for j in 0..<n {
        if map[i][j] == 0{
            answer.append(dfs(i,j,0))
        }
    }
}

print(answer.count)
for item in answer.sorted() {
    print(item, terminator: " ")
}