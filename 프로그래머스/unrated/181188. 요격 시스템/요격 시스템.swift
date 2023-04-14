import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted{ ($0[1],$0[0]) > ($1[1],$1[0]) }
    var answer = 0
    var end = -1
    
    while !targets.isEmpty {
        let target = targets.popLast()!
        if target[0] >= end {
            answer += 1
            end = target[1]
        }
    }
    return answer
}