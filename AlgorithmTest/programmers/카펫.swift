//
//  카펫.swift
//  코딩테스트 연습 > 완전탐색 > 카펫
//  https://programmers.co.kr/learn/courses/30/lessons/42842?language=swift
//
//  Created by SeongHoon Jang on 2022/05/25.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let rc = (brown-4)/2
    var answer = [0,0]
    for i in 1...rc {
        if i * (rc-i) == yellow {
            answer = [rc-i+2, i+2]
            break
        }
    }
    return answer
}

print(solution(10, 2))
print(solution(8, 1))
print(solution(24, 24))
