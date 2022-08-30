//
//  BOJ2748.swift
//  피보나치 수 2 - DP
//
//  Created by SeongHoon Jang on 2022/08/30.
//

import Foundation

let num = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 91)

dp[0] = 0
dp[1] = 1
dp[2] = 1

if num>2 {
    for index in 3...num {
        dp[index] = dp[index-1] + dp[index-2]
    }
}

print(dp[num])
