let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
let m = input[1]

var arr: [[Int]] = []
for _ in 0..<n {
    arr.append(readLine()!.split{ $0 == " " }.map{ Int($0)! })
}

var cnt : [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

var answer = check(0,0)
print(answer)

func canGo(_ x: Int, _ y: Int) -> Bool {
    if x < 0 || x >= n || y < 0 || y >= m {
        return false
    }
    return true
}

func check(_ x: Int, _ y: Int) -> Int {
    if x == n-1, y == m-1 {
        return 1
    }
    
    for d in [(1,0),(0,1),(-1,0),(0,-1)] {
        let nx = x + d.0
        let ny = y + d.1
        
        if !canGo(nx, ny) {
            continue
        }
        
        if arr[nx][ny] >= arr[x][y] {
            continue
        }

        if cnt[nx][ny] > 0 {
            cnt[x][y] += cnt[nx][ny]
        } else if cnt[nx][ny] == 0 {
            cnt[x][y] += check(nx,ny)
        }
    }
    
    if cnt[x][y] == 0 {
        cnt[x][y] = -1
        return 0
    } else {
        return cnt[x][y]
    }
}