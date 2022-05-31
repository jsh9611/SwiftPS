//
//  점프와순간이동.swift
//  코딩테스트 연습 > Summer/Winter Coding(~2018) > 점프와 순간 이동
//

import Foundation

// 100점
func solution(_ n:Int) -> Int {
    var ans:Int = 0
    var num = n
    while num > 0 {
        if num % 2 == 1 {
            ans += 1
        }
        num /= 2
    }
    return ans
}

// 60점 - 효율성 테스트 통과못함
func solution2(_ n:Int) -> Int { String(n, radix: 2).filter { $0 == "1" }.count }
