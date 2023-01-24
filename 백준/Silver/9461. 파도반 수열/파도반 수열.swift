var dp = [Int](repeating: 0, count: 101)
dp[1] = 1
dp[2] = 1
dp[3] = 1
dp[4] = 2
for i in 5...100 {
    dp[i] = dp[i-5] + dp[i-1]
}
for _ in 0..<(Int(readLine()!)!) {
    print(dp[Int(readLine()!)!])
}