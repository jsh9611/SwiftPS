let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.sort()
var answer = 0
for i in 0..<n {
    answer = max(answer, arr[i] * (n-i))
}
print(answer)