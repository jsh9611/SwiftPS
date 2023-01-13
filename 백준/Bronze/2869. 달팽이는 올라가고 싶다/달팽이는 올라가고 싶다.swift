let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let a = input[0], b = input[1], v = input[2]

let temp1 = v - a
let temp2 = a - b
let day = temp1 / temp2 + 1

print(temp1 % temp2 != 0 ? day+1 : day)