let n = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append(input)
}

var RGB = [[Int]](repeating: [Int](repeating: 1001, count: 3), count: 1001)
RGB[0] = arr[0]

for i in 1..<n {
    RGB[i][0] = min(RGB[i-1][1], RGB[i-1][2]) + arr[i][0]
    RGB[i][1] = min(RGB[i-1][0], RGB[i-1][2]) + arr[i][1]
    RGB[i][2] = min(RGB[i-1][0], RGB[i-1][1]) + arr[i][2]
}
print(RGB[n-1].min()!)