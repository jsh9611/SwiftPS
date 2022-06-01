//
//  k진수에서소수개수구하기.swift
//  코딩테스트 연습 > 2022 KAKAO BLIND RECRUITMENT > k진수에서 소수 개수 구하기
//  진법 변환, 소수 판정, 
//

import Foundation

func convertNum(_ n:Int, _ k:Int) -> String {
    var convertedNum = ""
    var num = n
    while num > 0 {
        convertedNum = String(num % k) + convertedNum
        num = num / k
    }
    return convertedNum
}

func isPrimeNum(_ n:Int) -> Bool {
    if n == 1 { return false }
    for i in 2..<Int(sqrt(Double(n)))+1 {
        if n % i == 0 { return false }
    }
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    var answer = 0
    let nums = convertNum(n, k).components(separatedBy: "0")
    for num in nums {
        if let number = Int(num) {
            if isPrimeNum(number) {
                answer += 1
            }
        }
    }
    return answer
}

print(solution(437674, 3))
print(solution(110011, 10))
