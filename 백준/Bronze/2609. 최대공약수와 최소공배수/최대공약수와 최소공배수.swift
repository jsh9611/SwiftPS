let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var a = max(input[0],input[1])
var b = min(input[0],input[1])
var r = 0

while b != 0 {
    r = a % b
    a = b
    b = r
}

print(a)
print(input[0]*input[1]/a)