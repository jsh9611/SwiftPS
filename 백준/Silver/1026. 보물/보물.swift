let n = Int(readLine()!)!
let a = readLine()!.split{ $0 == " " }.map{ Int($0)! }.sorted(by: >)
let b = readLine()!.split{ $0 == " " }.map{ Int($0)! }.sorted()

var answer = 0
for i in 0..<n {
    answer += a[i]*b[i]
}

print(answer)