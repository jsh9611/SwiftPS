let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)

for i in 1...n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    for j in 0..<i {
        if j == 0 {
            dp[i][j] = dp[i-1][j] + input[j]
        } else {
            dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + input[j]
        }
        
    }
}
print(dp[n].max()!)