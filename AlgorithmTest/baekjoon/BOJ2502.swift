import Foundation

let input = readLine()!.components(separatedBy: " ")
let d = Int(input[0])!
let k = Int(input[1])!

var dp = [Int](repeating: 0, count: 35)
var dp2 = [Int](repeating: 0, count: 35)

dp[1] = 1
dp2[2] = 1

for i in (3...d){
    dp[i] = dp[i-1] + dp[i-2]
    dp2[i] = dp2[i-1] + dp2[i-2]
}

for i in 1...k {
    let spare = k - (dp[d]*i)
    if spare % dp2[d] == 0 {
        print(i, spare / dp2[d])
        break
    }
}
