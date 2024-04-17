import Foundation

func timeToMinute(timetable: String) -> Int {
    let time = timetable.split(separator: ":").map{ Int($0)! }
    return time[0]*60 + time[1]
}

func solution(_ plans:[[String]]) -> [String] {
    let plans = plans.sorted{ $0[1] < $1[1] }
    var tasks: [(name: String, left: Int)] = []
    var results: [String] = []
    
    let finalTaskTime = timeToMinute(timetable: plans.last![1])
    var currentTime = timeToMinute(timetable: plans[0][1])
    
    for plan in plans {
        let planName = plan[0]
        let planMinute = timeToMinute(timetable: plan[1])
        let planLeft = Int(plan[2])!
        
        while let prev = tasks.popLast() {
            if planMinute-currentTime >= prev.left {
                results.append(prev.name)
                currentTime += prev.left
            } else {
                tasks.append((prev.name, prev.left - planMinute + currentTime))
                break
            }
        }
        
        tasks.append((planName, planLeft))
        currentTime = planMinute
    }
    
    while let task = tasks.popLast() {
        results.append(task.name)
    }
    
    return results
}