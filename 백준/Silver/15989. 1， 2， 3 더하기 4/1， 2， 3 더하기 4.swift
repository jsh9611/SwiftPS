let t = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 10001)
dp[1] = 1
dp[2] = 2
dp[3] = 3
dp[4] = 4
dp[5] = 5

for n in 6...10000 {
    dp[n] = dp[n-3] + dp[n-2] - dp[n-5] + 1
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n])
}