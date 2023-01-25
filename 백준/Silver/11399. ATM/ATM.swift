let n = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
arr.sort()
var answer = 0
for i in 0..<n {
    answer += arr[i]*(n-i)
}
print(answer)