// https://www.acmicpc.net/problem/9576

extension Array {
    func tuple() -> (Element,Element) {
        return (self[0],self[1])
    }
}

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    let n = input[0]
    let m = input[1]
    
    var answer = 0
    var student = [(Int, Int)]()
    var isBorrowed = [Bool](repeating: false, count: 1004)
    
    defer { print(answer) }
    
    for _ in 0..<m {
        student.append(readLine()!.split{ $0 == " " }.map{ Int($0)! }.tuple())
    }
    
    student.sort{ ($0.1,$0.0) < ($1.1,$1.0) }
    
    for i in 0..<m {
        while student[i].0 <= student[i].1 {
            if !isBorrowed[student[i].0] {
                isBorrowed[student[i].0] = true
                answer += 1
                break
            } else {
                student[i].0 += 1
            }
        }
    }
}
/*
틀렸던 테스트 케이스
1
7 4
1 7
1 7
1 7
2 2
*/
