let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
var dp = [Int](repeating: 0, count: n+1)
if n <= 2 {
    print(arr.reduce(0) { $0 + $1 })
} else {
    dp[1] = arr[0]
    dp[2] = arr[0] + arr[1]

    for i in 3...n {
        dp[i] = max(dp[i-2], dp[i-3]+arr[i-2]) + arr[i-1]
    }
    print(dp[n])
}