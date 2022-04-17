import Foundation

func solution(_ s:String) -> Int {
    var str = s
    str = str.replacingOccurrences(of: "zero", with: "0")
    str = str.replacingOccurrences(of: "one", with: "1")
    str = str.replacingOccurrences(of: "two", with: "2")
    str = str.replacingOccurrences(of: "three", with: "3")
    str = str.replacingOccurrences(of: "four", with: "4")
    str = str.replacingOccurrences(of: "five", with: "5")
    str = str.replacingOccurrences(of: "six", with: "6")
    str = str.replacingOccurrences(of: "seven", with: "7")
    str = str.replacingOccurrences(of: "eight", with: "8")
    str = str.replacingOccurrences(of: "nine", with: "9")
    
    return Int(str) ?? 0
}
"""
출처: 프로그래머스
https://programmers.co.kr/learn/courses/30/lessons/81301

풀이:
zero -> 0, one -> 1, ... , nine -> 9 식으로 전부 치환하였다.
"""
