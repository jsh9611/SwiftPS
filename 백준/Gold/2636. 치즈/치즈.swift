let input = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = input[0]
let m = input[1]

var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split{ $0 == " " }.map{ Int($0)! })
}

func dfs(_ x: Int, _ y: Int) {
    
    if map[x][y] == 1 {
        return
    }
    
    map[x][y] = 2
    
    if x-1 >= 0 && map[x-1][y] == 0 { dfs(x-1, y) }
    if y-1 >= 0 && map[x][y-1] == 0 { dfs(x, y-1) }
    if x+1 < n && map[x+1][y] == 0 { dfs(x+1, y)}
    if y+1 < m && map[x][y+1] == 0 { dfs(x, y+1)}
}

var time = 0
var cheese = 0
while true {
    
    dfs(0, 0)
    
    var slice = 0
    for i in 1..<n-1 {
        for j in 1..<m-1 {
            
            if map[i][j] != 1 {
                continue
            }
            
            if map[i-1][j] == 2 || map[i+1][j] == 2 || map[i][j-1] == 2 || map[i][j+1] == 2 {
                map[i][j] = 0
                slice += 1
            }
        }
    }
    
    if slice == 0 {
        print(time)
        print(cheese)
        break
    }
    
    cheese = slice
    time += 1
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 2 {
                map[i][j] = 0
            }
        }
    }
}