//
//  BOJ2096.swift
//  내려가기 - 다이나믹프로그래밍
//
//  Created by SeongHoon Jang on 2022/08/18.
//

import Foundation

let n = Int(readLine()!)!
var arr : [[Int]] = []

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var maxArr = arr
var minArr = arr

for i in 1..<n {
    maxArr[i][0] += max(maxArr[i-1][0], maxArr[i-1][1])
    maxArr[i][1] += max(maxArr[i-1][0], maxArr[i-1][1], maxArr[i-1][2])
    maxArr[i][2] += max(maxArr[i-1][1], maxArr[i-1][2])
    
    minArr[i][0] += min(minArr[i-1][0], minArr[i-1][1])
    minArr[i][1] += min(minArr[i-1][0], minArr[i-1][1], minArr[i-1][2])
    minArr[i][2] += min(minArr[i-1][1], minArr[i-1][2])
}

print(maxArr[n-1].max()!, minArr[n-1].min()!)
