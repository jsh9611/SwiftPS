//
//  BOJ1699.swift
//  제곱수의 합 - DP
//  https://www.acmicpc.net/problem/1699
//
//  자연수 N을 이렇게 제곱수들의 합으로 표현할 때에 그 항의 최소개수를 구하는 프로그램
//

import Foundation

let num = Int(readLine()!)!
var dp = [Int](repeating: 100001, count: num+1)

for i in 1...(Int(sqrt(Double(num)))) {
    dp[i * i] = 1
}
print(answer(n: num))

func answer(n: Int) -> Int{
    if dp[n] == 100001 {
        for j in 1...num {
            for i in (0...Int(sqrt(Double(j)))).reversed(){
               dp[j] = min(dp[j-(i*i)]+1, dp[j])
            }
        }
    
    }
    return dp[n]
}
