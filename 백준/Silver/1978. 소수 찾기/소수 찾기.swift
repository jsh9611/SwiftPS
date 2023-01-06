let _ = readLine()
let number = 1000
let arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }

var field = [Int](0...number)

for i in 2...number {
    if field[i] == 0 { continue }
    
    var j = i*2
    while j <= number {
        field[j] = 0
        j += i
    }
}

var answer = 0
for i in 2...number {
    if arr.contains(field[i]) {
        answer += 1
    }
}

print(answer)