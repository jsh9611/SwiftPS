//
//  BOJ2343.swift
//  기타 레슨 - 이분 탐색(binarySearch)
//
//  Created by SeongHoon Jang on 2022/08/22.
//

import Foundation

func sum(_ numbers: [Int]) -> Int {
  return numbers.reduce(0, +)
}

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let n = nm[0]
let m = nm[1]

let lecture:[Int] = readLine()!.split(separator: " ").map{Int(String($0))!}

var start = lecture.max()!
var end = sum(lecture)

while start <= end {
    let mid = (start + end) / 2
    var sum = 0
    var cnt = 1
    
    for item in lecture {
        if item > mid {
            continue
        }
        sum += item
        if sum > mid {
            sum = item
            cnt += 1
        }
    }
    
    if cnt > m {
        start = mid + 1
    } else { // (cnt <= m)
        end = mid - 1
    }
}

print(start)
