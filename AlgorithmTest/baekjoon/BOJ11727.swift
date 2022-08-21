//
//  BOJ11727.swift
//  2×n 타일링 2 - 다이나믹프로그래밍
//
//  Created by SeongHoon Jang on 2022/08/21.
//

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 1001)
dp[1] = 1
dp[2] = 3
if n > 2 {
    for i in 3...n {
        // i 번째 타일의 경우의 수 = i-1 번째 타일의 경우의 수 + i-2 번째 타일의 경우의 수 x 2
        dp[i] = (dp[i-1] + 2 * dp[i-2]) % 10007
    }
}

print(dp[n])
