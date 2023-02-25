let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.sort()

func solution() -> Int {
    var idx = 0
    var cnt = 1
    var ans = 1

    for i in 1..<n {
        cnt += 1
        while arr[i] - arr[idx] > 4 {
            cnt -= 1
            idx += 1
        }
        ans = max(ans, cnt)
        if ans >= 5 {
            return 5 - ans
        }
    }
    return 5 - ans
}

print(solution())