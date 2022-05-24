//
//  가장큰정사각형찾기.swift
//  AlgorithmTest
//
//  Created by SeongHoon Jang on 2022/05/23.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
    let x = board.count
    let y = board[0].count
    var answer:Int = 0
    
//    var copy = board    // 1
    var copy = board.map{$0.map{$0}}
    
    for i in 0..<x {
        if board[i][0] == 1 {
            answer = 1
            break
        }
    }
    for j in 0..<y {
        if board[0][j] == 1 {
            answer = 1
            break
        }
    }
    for i in 1..<x {
        for j in 1..<y {
            if board[i][j] == 0 {
                continue
            }
            copy[i][j] = min(copy[i-1][j-1], copy[i-1][j], copy[i][j-1]) + 1
            answer = max(answer, copy[i][j])
        }
    }
    
    return answer * answer
}

print(solution([[0,0,1,1],[1,1,1,1]]))  // 4
print(solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]))  // 9
print(solution([[0, 0, 0, 0],[1, 0, 0, 0],[1, 0, 0, 0],[0, 0, 0, 0]])) // 1

/*
 1) 탐나에게 배운 지식
    Swift에선 배열의 deepcopy를 단순히 저렇게 해도 잘 된다.
 */
