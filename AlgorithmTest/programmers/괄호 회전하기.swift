//
//  괄호 회전하기.swift
//  코딩테스트 연습 > 월간 코드 챌린지 시즌2 > 괄호 회전하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/76502
//  
//  Created by SeongHoon Jang on 2022/08/28.
//

import Foundation

func solution(_ s:String) -> Int {
    var str = s
    var cnt = s.count
    if cnt % 2 == 1 {
        return 0
    }

    for _ in 0..<s.count {
        var big = 0
        var mid = 0
        var small = 0

        for item in str {
            
            if item == "[" {
                big += 1
            } else if item == "]" {
                big -= 1
            } else if item == "{" {
                mid += 1
            } else if item == "}" {
                mid -= 1
            } else if item == "(" {
                small += 1
            } else if item == ")" {
                small -= 1
            }

            if big < 0 || mid < 0 || small < 0 {
                break
            }
        }
        if big != 0 || mid != 0 || small != 0 {
            cnt -= 1
        } else {
            for errorCase in ["(}","(]","{)","{]","[)","[}"] {
                if str.contains(errorCase) {
                    cnt -= 1
                    break
                }
            }
        }
        let temp = String(str.first!)
        str.removeFirst()
        str += temp
    }
    return cnt
}

let s1 = "[](){}"
let s2 = "}]()[{"
let s3 = "[)(]"
let s4 = "}}}"
let s5 = "()("
let s6 = "("
let s7 = "{{{{{{"
let s8 = "[(])"
let s9 = "(([[]]))"

print(solution(s1))
