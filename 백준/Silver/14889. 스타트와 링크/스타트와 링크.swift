let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<n {
    arr.append(readLine()!.split{ $0 == " " }.map{ Int($0)! })
}
var answer = 99999999
for i in 0..<(1<<n - 1) {
    var team1 = [Int]()
    var team2 = [Int]()
    for j in 0..<n {
        // 두 팀이 겹치는 경우
        if i & (1<<j) > 0 {
            team1.append(j)
        } else {
            team2.append(j)
        }
    }
    var stat1 = 0
    var stat2 = 0
    
    if team1.count == n/2, team2.count == n/2 {
        for p in 0..<n/2 {
            for q in 0..<n/2 {
                if p == q { continue }
                stat1 += arr[team1[p]][team1[q]]
                stat2 += arr[team2[p]][team2[q]]
            }
        }
        answer = min(answer, abs(stat1-stat2))
    }
}
print(answer)