//
//  BOJ1467.swift
//  https://www.acmicpc.net/problem/1463
//  1로 만들기
//

import Foundation

let num = Int(readLine()!)!

print(answer(n: num))

func answer(n: Int) -> Int {
    if n == 1 {
        return 0
    }
    
    if n < 4 {
        return 1
    }

    var dp = [Int](repeating: 0, count: num+1)
    
    dp[1] = 0
    dp[2] = 1
    dp[3] = 1
    
    for i in 4...n {
        
        var temp2 = 99999
        var temp3 = 99999
        
        if i % 2 == 0 {
            temp2 = dp[i/2] + 1
        }
        
        if i % 3 == 0 {
            temp3 = dp[i/3] + 1
        }
        
        dp[i] = min(dp[i-1]+1, temp2, temp3)
    }
    
    return dp[n]
}
