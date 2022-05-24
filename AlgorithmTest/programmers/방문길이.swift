//
//  방문길이.swift
//  Summer/Winter Coding(~2018)
//
//  Created by SeongHoon Jang on 2022/05/24.
//

import Foundation

func solution(_ dirs:String) -> Int {
    
    struct Edge: Hashable {
        let x: Int
        let y: Int
        let nx: Int
        let ny: Int
        init(x: Int, y:Int, nx: Int, ny: Int){
                self.x = x
                self.y = y
                self.nx = nx
                self.ny = ny
        }
    }
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, 1, -1]
    let d = ["U": 0, "D": 1, "R": 2, "L": 3]
    var x = 0
    var y = 0

    var visited = Set<[Int]>()   // 1
//    var visited = Set<Edge>()
    
    var index = 0
    var nx = 0
    var ny = 0
    
    for item in dirs {
        index = d[String(item)]!
        nx = x + dx[index]
        ny = y + dy[index]
        
        if nx > 5 || ny > 5 || nx < -5 || ny < -5 {
            continue
        }
        visited.insert(Edge(x: x, y: y, nx: nx, ny: ny))
        visited.insert(Edge(x: nx, y: ny, nx: x, ny: y))
        x = nx
        y = ny
    }
    return visited.count / 2
}

print(solution("ULURRDLLU"))    // 7
print(solution("LULLLLLLU"))    // 7

/*
 1) 탐나에게 배운 지식
    Swift는 Set의 원소로 배열을 받을 수 있다.
    다음번엔 Edge Struct를 만드는 대신 [Int]를 활용해야겠다.
 */
