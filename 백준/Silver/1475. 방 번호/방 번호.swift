let n = Array(readLine()!).map{ Int(String($0))! }
var arr = [Int](repeating: 0, count: 10)

for num in n {
    arr[num] += 1
}
arr[6] = (arr[6]+arr[9])/2 + (arr[6]+arr[9])%2
arr[9] = 0
print(arr.max()!)