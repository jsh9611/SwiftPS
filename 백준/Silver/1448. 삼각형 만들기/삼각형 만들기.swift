let n = Int(readLine()!)!

var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort(by: >)

var answer = -1
for i in 0..<n-2 {
    if arr[i] < arr[i+1] + arr[i+2] {
        answer = arr[i] + arr[i+1] + arr[i+2]
        break
    }
}

print(answer)