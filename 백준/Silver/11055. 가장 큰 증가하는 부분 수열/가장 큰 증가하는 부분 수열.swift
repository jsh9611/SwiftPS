let n = Int(readLine()!)!
let arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }

var dp = [Int](repeating: 0, count: n)
for i in 0..<n {
    
    dp[i] = arr[i]
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + arr[i])
        }
    }
    
}

print(dp.max()!)