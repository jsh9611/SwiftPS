func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var times = [Int]()
    for time in timetable {
        let temp = time.split(separator: ":").map{ Int($0)! }
        let minutes = temp[0]*60 + temp[1]
        times.append(minutes)
    }
    
    times.sort(by: >)

    var currentTime = 9*60
    var crew = 60*24
    var M = 0
    

    for _ in 0..<n-1 {
        M = m
        while M > 0 && !times.isEmpty && times.last! <= currentTime {
            _ = times.popLast()!
            M -= 1
        }
        currentTime += t
    }
    
    M = m
    while !times.isEmpty {
        if M == 1 {
            if !times.isEmpty {
                let last = times.last!
                if last <= currentTime {
                    currentTime = last - 1
                }
            } else {
                if crew <= currentTime {
                    currentTime = crew - 1
                }
            }
            break
        }
        
        crew = times.popLast()!
        M -= 1
    }
    
    return "\(currentTime/60 < 10 ? "0" : "")\(currentTime/60):\(currentTime%60 < 10 ? "0" : "")\(currentTime%60)"
}
