//
//  BOJ2805.swift
//  AlgorithmTest
//  나무 자르기 - 이분탐색
//
//  Created by SeongHoon Jang on 2022/08/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
let logs = readLine()!.split(separator: " ").map{Int(String($0))!}

var start = 0
var end = logs.max()!

while start <= end {
    var homeLogs = 0
    let mid = (start + end) / 2
    for log in logs {
        if (log - mid) > 0 {
            homeLogs += (log - mid)
        }
    }
    if homeLogs >= m {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)
