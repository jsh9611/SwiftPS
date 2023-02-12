let n = Int(readLine()!)!
let arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var dp = [Int](repeating: 0, count: n)
var LIS = [Int]()

func lowerBound(_ val: Int) -> Int {
    var first = 0
    var last = LIS.count - 1
    
    while first < last {
        let mid = (first+last) / 2
        if LIS[mid] >= val {
            last = mid
        } else {
            first = mid + 1
        }
    }
    return last
}

var nowMAX = 0
var nowIdx = 0

for i in 0..<n {
    if LIS.count == 0 {
        LIS.append(arr[i])
    } else {
        if LIS.last! < arr[i] {
            LIS.append(arr[i])
            dp[i] = LIS.count - 1
        } else {
            let last = lowerBound(arr[i])
            LIS[last] = arr[i]
            dp[i] = last
        }
    }
    if dp[i] > nowMAX {
        nowIdx = i
        nowMAX = dp[i]
    }
}

var ans = [arr[nowIdx]]
var idx = nowIdx - 1
var now = nowIdx

while idx >= 0 {
    if arr[idx] < arr[now] && dp[idx]+1 == dp[now] {
        now = idx
        ans.append(arr[idx])
    }
    idx -= 1
}

var answer = "\(LIS.count)\n"
while !ans.isEmpty {
    answer += "\(ans.popLast()!) "
}

print(answer)