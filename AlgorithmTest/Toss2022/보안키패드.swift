//
//  보안키패드.swift
//  2022 토스 NEXT iOS Part 1 Test Problem
//
//  Created by SeongHoon Jang on 2022/08/05.
//  문제설명: -1 나오면 키 하나 지우기, -2 나오면 claer
//          나머지 숫자만큼 숫자 키패드에 입력하기
//          만약 n글자 초과해서 입력하면 초과된 입력은 무시됨.
//          n개보다 적게 입력이 주어지면 빈 문자열을 반환
//
import Foundation

func solution(_ n:Int, _ keyInputs:[Int]) -> String {
    
    let inputs : [Int]
    var ans : [String] = []
    
    if let lastClearIndex = keyInputs.lastIndex(of: -2) {
        inputs = Array(keyInputs[lastClearIndex...])
    } else {
        inputs = keyInputs
    }
    
    for idx in 0..<inputs.count {
        if inputs[idx] < 0 {
            ans.popLast()
        } else {
            if ans.count == n {
                continue
            }
            ans.append(String(inputs[idx]))
        }
    }
    
    
    if ans.count < n {
        return ""
    }

    return ans.joined()
}


let n = 4
let keyInputs = [3, 1, -1, 9, -1, -1, 9, 8, 2, 8, 6, 4, 4, -2, 1, 1, 3, 0, -1, 6]

print(solution(n, keyInputs))
