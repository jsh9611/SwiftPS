let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
let m = input[1]

var arr = [Int]()
for _ in 0..<m {
    arr.append(Int(readLine()!)!)
}

arr.sort()

var result = 0
var target = 0

for i in 0..<m {
    let egg = min(n, m-i)

    if result < arr[i] * egg {
        result = arr[i] * egg
        target = arr[i]
    }
}

print(target, result)