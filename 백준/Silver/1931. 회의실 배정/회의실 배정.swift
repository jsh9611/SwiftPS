extension Array {
    func splat() -> (Element,Element) {
        return (self[0],self[1])
    }
}

let n = Int(readLine()!)!
var times = [(Int,Int)]()
for _ in 0..<n {
    times.append(readLine()!.split{ $0 == " " }.map { Int($0)! }.splat())
}
times.sort{ ($0.0,$0.1) < ($1.0,$1.1) }

var answer = 0
var skip = 0
for time in times {
    if time.0 < skip {
        if time.1 < skip {
            skip = time.1
        }
        continue
    }
    skip = time.1
    answer += 1
}
print(answer)