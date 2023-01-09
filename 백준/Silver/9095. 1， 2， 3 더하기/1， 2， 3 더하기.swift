let n = Int(readLine()!)!
var dp = [Int](repeating: 1, count: 11)
dp[2] = 2
dp[3] = 4

for i in 4..<11 {
    dp[i] = dp[i-1]*2 - dp[i-4]
}

for _ in 0..<n {
    print(dp[Int(readLine()!)!])
}