let n = Int(readLine()!)!

var numbers = [Int](repeating: 0, count: 10001)

for _ in 0..<n {
    let num = Int(readLine()!)!
    numbers[num] += 1
}

var answer = ""

for i in 0..<10001 {
    answer += String(repeating: "\(i)\n", count: numbers[i])
}

print(answer)