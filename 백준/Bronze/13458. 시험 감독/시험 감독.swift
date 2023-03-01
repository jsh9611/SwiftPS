let n = Int(readLine()!)!
var people = readLine()!.split{ $0 == " " }.map{ Int($0)! }

let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let total = input[0]
let sub = input[1]
var answer = n

for i in 0..<n {
    people[i] -= total
}

for person in people {
    if person <= 0 {
        continue
    }
    answer += (person / sub) + (person % sub > 0 ? 1 : 0)
}

print(answer)