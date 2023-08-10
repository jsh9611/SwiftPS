import Foundation

func solution(_ n:Int) -> Int {
    let mod = 1000000007
    var dp = [Int](repeating: 0, count: 100001)
    dp[0] = 1
    dp[1] = 1
    dp[2] = 3
    dp[3] = 10
    dp[4] = 23
    dp[5] = 62
    
    if n >= 6 {
        for i in 6...n {
            dp[i] = (dp[i-1] + dp[i-2]*2 + dp[i-3]*6 + dp[i-4] - dp[i-6] + mod)%mod
        }
    }
    
    return dp[n]
}