import Foundation

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var dp = [[Int]](repeating: [Int](repeating: 10000, count: 155), count: 155)
    var alpMax = 0
    var copMax = 0
    
    for problem in problems {
        alpMax = max(alpMax, problem[0])
        copMax = max(copMax, problem[1])
    }
    
    let alp = min(alp, alpMax)
    let cop = min(cop, copMax)
    
    dp[alp][cop] = 0
    for i in alp...alpMax {
        for j in cop...copMax {
            dp[i+1][j] = min(dp[i+1][j], (dp[i][j] + 1))
            dp[i][j+1] = min(dp[i][j+1], (dp[i][j] + 1))
            for problem in problems {
                let alpReq = problem[0]
                let copReq = problem[1]
                let alpRwd = problem[2]
                let copRwd = problem[3]
                let cost = problem[4]
                
                if i < alpReq || j < copReq { continue }
                
                let alpNext = min(i+alpRwd, alpMax) // 초과된 알고력 무시
                let copNext = min(j+copRwd, copMax) // 초과된 코딩력 무시
                
                dp[alpNext][copNext] = min(dp[i][j]+cost, dp[alpNext][copNext])
            }
        }
    }

    return dp[alpMax][copMax]
}