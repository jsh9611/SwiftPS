//
//  BOJ_2133.swift
//  타일 채우기 - 다이나믹 프로그래밍
//

import Foundation

func solution1(_ n : Int) -> Int {
    if n % 2 == 1 {
        return 0
    }
    var dp = [Int](repeating: 0, count: 16)
    dp[0] = 1
    dp[1] = 3
    for i in 2...15 {
        dp[i] = dp[i-1] * 3
        for j in 0...(i-2) {
            dp[i] += dp[j] * 2
        }
    }
    return dp[n/2]
}

func solution2(_ n : Int) -> Int {
    if n % 2 == 1 {
        return 0
    }
    var dp = [Int](repeating: 0, count: 16)
    dp[1] = 3
    dp[2] = 11
    for i in 3...15 {
        dp[i] = dp[i-1]*4 - dp[i-2]
    }
    return dp[n/2]
}

let n = Int(readLine()!)!

print(solution1(n))
print(solution2(n))
