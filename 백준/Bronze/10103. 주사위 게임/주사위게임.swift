// https://www.acmicpc.net/problem/10103

var a = 100
var b = 100
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    if input[0] > input[1] {
        b -= input[0]
    } else if input[0] < input[1] {
        a -= input[1]
    }
}

print(a)
print(b)
