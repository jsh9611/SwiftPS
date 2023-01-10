let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
let m = input[1]
let max = 1000000
var arr = [Int](0...max)

for i in 2...max {
    if arr[i] == 0 { continue }
    if i >= n, i <= m {
        print(i)
    }
    if i > m {
        break
    }
    
    var j = i*2
    while j <= max {
        arr[j] = 0
        j += i
    }
}