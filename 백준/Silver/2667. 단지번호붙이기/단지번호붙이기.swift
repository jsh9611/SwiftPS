let n = Int(readLine()!)!

var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.map{ Int(String($0))! })
}

func dfs(_ x: Int, _ y: Int, _ cnt: Int) -> Int {
    if x < 0 || y < 0 || x >= n || y >= n || map[x][y] == 0 {
        return cnt
    }
    map[x][y] = 0
    
    return dfs(x+1,y,cnt+1) + dfs(x-1,y,0) + dfs(x,y+1,0) + dfs(x,y-1,0)
}

var answer = [Int]()

for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == 1{
            answer.append(dfs(i,j,0))
        }
    }
}

print(answer.count)
for item in answer.sorted() {
    print(item)
}