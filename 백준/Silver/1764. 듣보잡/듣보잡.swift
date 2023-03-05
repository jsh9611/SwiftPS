let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
let m = input[1]

var people = Set<String>()
var answer = Set<String>()

for _ in 0..<n {
    people.insert(readLine()!)
}

for _ in 0..<m {
    let man = readLine()!
    if people.contains(man) {
        answer.insert(man)
    }
}

print(answer.count)
print(answer.sorted().joined(separator: "\n"))