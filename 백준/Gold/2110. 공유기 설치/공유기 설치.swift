let input = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = input[0]
let c = input[1]

var home = [Int]()
for _ in 0..<n {
    home.append(Int(readLine()!)!)
}
home.sort()

var left = 1
var right = home[n-1] - home[0]
while left <= right {
    let mid = (left+right) / 2
    var cnt = 1
    var before = home[0]
    
    for i in 1..<n {
        if home[i] - before >= mid {
            cnt += 1
            before = home[i]
        }
    }

    if cnt < c {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(left - 1)