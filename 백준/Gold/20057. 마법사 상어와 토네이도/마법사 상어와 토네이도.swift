let n = Int(readLine()!)!
var grid = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    grid.append(input)
}

let dirs = [(0, -1), (1, 0), (0, 1), (-1, 0)]   // 0: 좌, 1: 하, 2: 우, 3: 상
let ALPHA = Int.max

let leftRate = [(-2, 0, 2), (-1, -1, 10), (-1, 0, 7),
                (-1, 1, 1), (0, -2, 5), (0, -1, ALPHA),
                (1, -1, 10), (1, 0, 7), (1, 1, 1), (2, 0, 2)]
let rightRate = leftRate.map{ ($0.0, -$0.1, $0.2) }
let downRate = leftRate.map{ (-$0.1, $0.0, $0.2) }
let upRate = leftRate.map{ ($0.1, $0.0, $0.2) }
let rates = [leftRate, downRate, rightRate, upRate]

var currDir = 0
var next = (n/2, n/2)
var times = 1
var answer = 0

func isOutOfRange(_ i: Int, _ j: Int) -> Bool {
    return i < 0 || j < 0 || i >= n || j >= n
}

func tornadoes(_ i: Int, _ j: Int, _ currDir: Int) -> (Int,Int) {
    var temp_i = i+dirs[currDir].0
    var temp_j = j+dirs[currDir].1
    
    var next_i = temp_i
    var next_j = temp_j
    
    let rate = rates[currDir]
    let totalSand = grid[next_i][next_j]
    var remainSand = totalSand
    var (alpha_i, alpha_j) = (next_i, next_j)

    for (di, dj, weight) in rate {
        (temp_i, temp_j) = (next_i+di, next_j+dj)
        if weight == ALPHA {
            (alpha_i, alpha_j) = (temp_i, temp_j)
            continue
        }
        // 토네이도가 날려버리는 먼지 계산
        let partOfSand = Int(totalSand * weight / 100)
        remainSand = remainSand - partOfSand
        
        if isOutOfRange(temp_i, temp_j) {
            answer += partOfSand
        } else {
            grid[temp_i][temp_j] += partOfSand
        }
    }
    // 남은 모래를 ALPHA에 집어넣음
    if isOutOfRange(alpha_i, alpha_j) {
        answer += remainSand
    } else {
        grid[alpha_i][alpha_j] += remainSand
    }
    
    grid[next_i][next_j] = 0
    
    return (next_i, next_j)
}

while times < n {
    for _ in 0..<2 {
        for _ in 0..<times {
            next = tornadoes(next.0, next.1, currDir)
        }
        
        currDir = (currDir + 1) % 4
    }
    
    if times == n-1 {
        for _ in 0..<times {
            next = tornadoes(next.0, next.1, currDir)
        }
    }
    
    times += 1
    
}

print(answer)