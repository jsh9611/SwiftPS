let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = input[0]
let m = input[1]

var arr = [[Int]]()
for _ in 0..<n {
    arr.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)

for i in 0..<n {
    for j in 0..<n {
        dp[i+1][j+1] = dp[i][j+1] + dp[i+1][j] - dp[i][j] + arr[i][j]
    }
}

var answer = ""
for _ in 0..<m {
    let temp = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let x1 = temp[0], y1 = temp[1], x2 = temp[2], y2 = temp[3]
    answer += "\(dp[x2][y2] - dp[x1 - 1][y2] - dp[x2][y1 - 1] + dp[x1 - 1][y1 - 1])\n"
}
print(answer)