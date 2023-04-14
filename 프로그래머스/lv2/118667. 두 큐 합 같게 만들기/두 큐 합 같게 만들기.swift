import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let cnt = queue1.count
    var answer = 0
    
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    
    var idx1 = 0
    var idx2 = 0
    
    var idxA = 0
    var idxB = 0
    
    while true {
        if sum1 == sum2 { return answer }
        
        if sum1 > sum2 {
            
            if idx1 >= cnt {
                if idxB >= idx2 { return -1 }
                sum1 -= queue2[idxB]
                sum2 += queue2[idxB]
                idxB += 1
            } else {
                
                sum1 -= queue1[idx1]
                sum2 += queue1[idx1]
                idx1 += 1
            }
            answer += 1

        } else if sum2 > sum1 {
            
            if idx2 >= cnt {
                if idxA >= idx1 { return -1 }
                sum2 -= queue1[idxA]
                sum1 += queue1[idxA]
                idxA += 1
            } else {
                
                sum2 -= queue2[idx2]
                sum1 += queue2[idx2]
                idx2 += 1
            }
            answer += 1
        }
    }
    return -1
}