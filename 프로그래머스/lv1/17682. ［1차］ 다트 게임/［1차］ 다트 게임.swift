func solution(_ dartResult:String) -> Int {
    var results = Array(dartResult).reversed().map{String($0)}
    
    var total = 0
    var middle = 0
    var last = 0
    
    var temp = -1
    while !results.isEmpty {
        let t1 = results.popLast()!
        if t1 == "*" {
            middle *= 2
            last *= 2
        } else if t1 == "#" {
            last *= -1
        } else if t1 == "S" {
            total += middle
            middle = last
            last = temp
        } else if t1 == "D" {
            total += middle
            middle = last
            last = temp * temp
        } else if t1 == "T" {
            total += middle
            middle = last
            last = temp * temp * temp
        } else {
            let t2 = Int(t1) ?? -1
            if t2 == 0, temp == 1 {
                temp = 10
            } else {
                temp = t2
            }
        }
    }
    
    return total + middle + last
}