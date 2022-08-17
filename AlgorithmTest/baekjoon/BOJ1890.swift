//
//  BOJ1890.swift
//  점프 - 다이나믹프로그래밍
//
//  Created by SeongHoon Jang on 2022/08/17.
//

import Foundation

let n = Int(readLine()!)!
var arr : [[Int]] = []
var dp : [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

if canRightJump(n: n, jump: arr[0][0], x: 0) {
    dp[0][arr[0][0]] = 1
}

if canDownJump(n: n, jump: arr[0][0], y: 0) {
    dp[arr[0][0]][0] = 1
}

for i in 0..<n {
    for j in 0..<n {
        if arr[i][j] == 0 {
            break
        }
        
        if dp[i][j] > 0 {
            if canRightJump(n: n, jump: arr[i][j], x: j) {
                dp[i][j + arr[i][j]] += dp[i][j]
            }
            
            if canDownJump(n: n, jump: arr[i][j], y: i) {
                dp[i + arr[i][j]][j] += dp[i][j]
            }
        }
    }
}

print(dp[n-1][n-1])

func canRightJump(n: Int, jump: Int, x: Int) -> Bool {
    if x + jump >= n {
        return false
    }
    return true
}

func canDownJump(n: Int, jump: Int, y: Int) -> Bool {
    if y + jump >= n {
        return false
    }
    return true
}
