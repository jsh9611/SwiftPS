import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    
    var requestTime = 0
    var currentTime = 0
    
    var todoList = jobs.sorted { $0[0] > $1[0] }
    var workList: [[Int]] = []
    
    while !todoList.isEmpty || !workList.isEmpty {
        
        while !todoList.isEmpty && currentTime >= todoList.last![0] {
            workList.append(todoList.popLast()!)
        }
        
        if !workList.isEmpty {
            workList.sort { $0[1] > $1[1] }
            
            let work = workList.popLast()!
            requestTime += (currentTime + work[1] - work[0])
            currentTime += work[1]
        } else {
            currentTime = todoList.last![0]
        }
        
    }
    return requestTime / jobs.count
}