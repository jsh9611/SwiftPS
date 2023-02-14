let n = Int(readLine()!)!
let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var dp = [Int](repeating: -1001, count: n+1)
for i in 0..<n {
    dp[i+1] = max(dp[i]+input[i],input[i])
}
print(dp.max()!)