//
//  BOJ1654.swift
//  랜선자르기 - 이분탐색
//
//  Created by SeongHoon Jang on 2022/08/19.
//

import Foundation

let nk = readLine()!.split(separator: " ").map({Int($0)!})
let n = nk[0]
let k = nk[1]

var wire : [Int] = []

for _ in 0..<n {
    wire.append(Int(readLine()!)!)
}

var start = 1
var end = wire.max()!

while start <= end {
    let mid = (start + end) / 2
    var sum = 0
    
    for item in wire {
        sum += (item / mid)
    }
    
    if sum >= k {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)
