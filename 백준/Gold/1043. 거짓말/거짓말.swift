let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0]    // 사람의 수
let m = nm[1]    // 파티의 수
let truth = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var parties = [Set<Int>]()

if truth[0] == 0 {
    for _ in 0..<m {
        let _ = readLine()!
    }
    print(m)
} else {
    var blackList = Set(truth[1...])
    
    for _ in 0..<m {
        let party = Set(readLine()!.split { $0 == " " }.map { Int(String($0))! }[1...])
        parties.append(party)
    }
    
    for _ in 0..<m {
        for party in parties {
            if !blackList.intersection(party).isEmpty {
                blackList = blackList.union(party)
            }
        }
    }

    var answer = 0
    for party in parties {
        if blackList.intersection(party).isEmpty {
            answer += 1
        }
    }
    print(answer)
}