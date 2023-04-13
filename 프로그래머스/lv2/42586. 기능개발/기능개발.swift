import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var tasks = progresses.reversed().map{ Int($0) }
    var speeds = speeds.reversed().map{ Int($0) }
    var answer = [Int]()
    
    while !tasks.isEmpty {
        var done = 0
        let cnt = tasks.count
        let multi = (100 - tasks[cnt-1]) / speeds[cnt-1] + ((100 - tasks[cnt-1]) % speeds[cnt-1]) == 0 ? 0 : 1
        
        for i in 0..<cnt {
            tasks[i] += (multi * speeds[i])
        }
        while !tasks.isEmpty {
            let t = tasks.popLast()!
            if t >= 100 {
                let _ = speeds.popLast()!
                done += 1
            } else {
                tasks.append(t)
                break
            }
        }
        if done > 0 {
            answer.append(done)
        }
    }
    
    return answer
}