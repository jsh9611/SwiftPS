let n = Int(readLine()!)!
var v = [0]
for _ in 0..<n {
  v.append(Int(readLine()!)!)
}

if n <= 2 {
  print(v.reduce(0, +))
} else {
    var dp = [Int](repeating: 0, count: n+1)
    dp[1] = v[1]
    dp[2] = v[1]+v[2]

    for i in 3...n {
      dp[i] = max(dp[i-3]+v[i-1]+v[i], dp[i-2]+v[i], dp[i-1])
    }
    print(dp[n])
}