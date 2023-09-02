func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var answer = [Int]()
    var history: [String:Int] = [:]
    
    for (person, point) in zip(name, yearning) {
        history[person] = point
    }
    
    for people in photo {
        var score = 0
        for person in people {
            if let point = history[person] {
                score += point
            }
        }
        answer.append(score)
    }
    
    return answer
}