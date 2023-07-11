let n = Int(readLine()!)!

var qna: [([Character],Int,Int)] = []
var total = 0

for _ in 0..<n {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    let ans = Array(String(input[0]))
    let s = input[1]
    let b = input[2]

    qna.append((ans,s,b))
}

for num in 123...987 {
    let check = Array(String(num))
    if Set(check).count < 3 || check.contains("0") {
        continue
    }
    var temp = 0
    
    for ans in qna {
        var tempS = 0
        var tempB = 0
        
        for i in 0..<3 {
            for j in 0..<3 {
                if ans.0[i] == check[j] {
                    if i == j {
                        tempS += 1
                    } else {
                        tempB += 1
                    }
                }
            }
        }
        
        if tempS != ans.1 || tempB != ans.2 {
            temp = -1
            break
        }
    }
    if temp != -1 {
        total += 1
    }
}

print(total)