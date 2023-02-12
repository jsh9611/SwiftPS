let n = Int(readLine()!)!
let arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var dp = [Int]()

func lowerBound(_ val: Int) -> Int {
    var first = 0
    var last = dp.count - 1
    
    while first < last {
        let mid = (first+last) / 2
        if dp[mid] >= val {
            last = mid
        } else {
            first = mid + 1
        }
    }
    return last
}

for i in 0..<n {
    let last = lowerBound(arr[i])
    if last == -1 || dp[last] < arr[i] {
        dp.append(arr[i])
    } else {
        dp[last] = arr[i]
    }
}
print(dp.count)