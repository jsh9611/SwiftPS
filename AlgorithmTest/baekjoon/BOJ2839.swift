//
//  BOJ2839.swift
//  설탕 배달 - 수학
//
//  Created by SeongHoon Jang on 2022/08/22.
//

import Foundation

var n = Int(readLine()!)!
var sugar = n
var cnt = 0
var answer = -1

while sugar >= 0 {
    if sugar % 5 == 0 {
        answer = cnt + (sugar / 5)
        break
    }
    sugar -= 3
    cnt += 1
}

print(answer)
