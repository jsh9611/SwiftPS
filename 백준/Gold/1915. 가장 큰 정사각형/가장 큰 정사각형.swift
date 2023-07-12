let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
let m = input[1]

var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.map{ Int(String($0))! })
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
var length = 0

for i in 0..<n {
    if map[i][0] == 1 {
        dp[i][0] = 1
        length = 1
    }
}

for j in 0..<m {
    if map[0][j] == 1 {
        dp[0][j] = 1
        length = 1
    }
}

for i in 1..<n {
    for j in 1..<m {
        if map[i][j] == 1 {
            dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
            length = max(length, dp[i][j])
        }
    }
}

print(length*length)