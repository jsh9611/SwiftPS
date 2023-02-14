import Foundation

let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
let k = input[1]

var coin = [Int]()
for _ in 0..<n {
    let value = Int(readLine()!)!
    if value <= k {
        coin.append(value)
    }
}

var dp = [Int](repeating: 0, count: k+1)
for c in coin {
    dp[c] += 1
    for i in c...k {
        dp[i] = dp[i]+dp[i-c] >= Int(pow(2.0, 31.0)) ? 0 : dp[i]+dp[i-c]
    }
}

print(dp[k])