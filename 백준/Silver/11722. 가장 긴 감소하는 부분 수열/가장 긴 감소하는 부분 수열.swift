let n = Int(readLine()!)!

var arr = readLine()!.split{ $0 == " " }.reversed().map{ Int($0)! }
var dp = [Int](repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}
print(dp.max()!)