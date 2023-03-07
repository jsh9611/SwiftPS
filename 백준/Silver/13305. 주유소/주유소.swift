let n = Int(readLine()!)!
let distance = readLine()!.split{ $0 == " " }.map{ Int($0)! } + [0]
let value = readLine()!.split{ $0 == " " }.map{ Int($0)! }

var minValue = 1_000_000_000
var answer = 0
for i in 0..<n {
    minValue = min(minValue, value[i])
    answer += distance[i] * minValue
}

print(answer)