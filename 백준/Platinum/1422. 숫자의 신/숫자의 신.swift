let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let k = input[0]
let n = input[1]

var numbers = [String]()
for _ in 0..<k {
    numbers.append(readLine()!)
}

numbers.sort {
    $0+$1 > $1+$0
}

let MAX = String(numbers.map{ Int($0)! }.max()!)
var answer = ""
var isChecked = false
for num in numbers {
    if num == MAX, !isChecked {
        answer += String(repeating: num, count: n-k+1)
        isChecked = true
    } else {
        answer += num
    }
}

print(answer)