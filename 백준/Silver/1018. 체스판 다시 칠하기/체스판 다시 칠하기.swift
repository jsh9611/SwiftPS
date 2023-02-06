let nm = readLine()!.split{ $0 == " " }.map{ Int($0)!}
let n = nm[0]
let m = nm[1]
var map = [[String]]()

var wStart = 0
var bStart = 0
var answer = Int.max

for _ in 0..<n {
    map.append(Array(readLine()!).map{ String($0) })
}

for i in 0..<n-7 {
    for j in 0..<m-7 {
        wStart = 0
        bStart = 0
        for a in i..<i+8 {
            for b in j..<j+8 {
                if (a+b)%2 == 0 {
                    if map[a][b] == "B" {
                        wStart += 1
                    } else {
                        bStart += 1
                    }
                } else {
                    if map[a][b] == "W" {
                        wStart += 1
                    } else {
                        bStart += 1
                    }
                }
            }
        }
        answer = min(answer, wStart, bStart)
    }
}
print(answer)