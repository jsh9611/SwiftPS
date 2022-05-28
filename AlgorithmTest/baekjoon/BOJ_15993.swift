//
//  BOJ_15993.swift
//  1, 2, 3 더하기 8
//  분류: 다이나믹 프로그래밍
//

import Foundation

let n = Int(readLine()!)!
var answer = [Int]()
for _ in 0..<n {
    let a = (Int(readLine()!)!)
    answer.append(a)
}
let temp = answer.max()!+1
var dp : [[Int]] = Array(repeating: Array(repeating: 0, count: temp), count: 2)
// 1을 만드는 경우: 짝수 0, 홀수 1
dp[0][1] = 0
dp[1][1] = 1
// 2를 만드는 경우: 짝수 1, 홀수 1
dp[0][2] = 1
dp[1][2] = 1
// 3을 만드는 경우: 짝수 2, 홀수 2
dp[0][3] = 2
dp[1][3] = 2
// 4이상의 짝수 만드는 법: 맨 뒤에 1,2,3 각각을 더해야 하는 홀수의 경우의 수만큼 더한다.
// 4이상의 홀수 만드는 법: 맨 뒤에 1,2,3 각각을 더해야 하는 짝수의 경우의 수만큼 더한다.
// 예) 5를 만들기 위한 경우의 수
// 5의 짝수 개수: 2만드는 홀수 개수 +3, 3만드는 홀수 개수 +2, 4 만드는 홀수 개수 +1 (홀수 + 1 = 짝수)
// 5의 홀수 개수: 2만드는 짝수 개수 +3, 3만드는 짝수 개수 +2, 4 만드는 짝수 개수 +1 (짝수 + 1 = 홀수)
// dp[0][i] = dp[1][i-3] + dp[1][i-2] + dp[1][i-1]
// dp[1][i] = dp[0][i-3] + dp[0][i-2] + dp[0][i-1]

for i in 4..<temp {
    dp[0][i] = (dp[1][i-3] + dp[1][i-2] + dp[1][i-1])%1000000009
    dp[1][i] = (dp[0][i-3] + dp[0][i-2] + dp[0][i-1])%1000000009
}

for item in answer {
    print(dp[1][item], dp[0][item])
}
