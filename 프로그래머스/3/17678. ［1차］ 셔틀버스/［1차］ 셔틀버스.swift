func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    let startTime = 9*60
    let sortedTimetable = timetable.map { Int($0.prefix(2))!*60 + Int($0.suffix(2))! }.sorted()
    let crewCount = timetable.count
    
    var crewIndex = 0
    var lastTime = startTime + (n-1) * t
    
    for idx in 0..<n {
        var cnt = 0
        while crewIndex < crewCount, sortedTimetable[crewIndex] <= startTime + (idx * t) {
            cnt += 1
            crewIndex += 1
            if cnt == m {
                if idx == n-1 {
                    lastTime = sortedTimetable[crewIndex-1]-1
                }
                break
            }
        }
    }
    
    return String(format: "%02d:%02d", lastTime/60, lastTime%60)
}