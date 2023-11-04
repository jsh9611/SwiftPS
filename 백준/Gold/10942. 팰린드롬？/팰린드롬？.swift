import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

let n = readInt()
var numbers = [Int]()
for _ in 0..<n {
    numbers.append(readInt())
}

// 펠린드롬 계산
var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for i in 0..<n {
    // 길이가 1인 경우
    dp[i][i] = true
    // 길이가 2인 경우
    if i+1 < n && numbers[i] == numbers[i+1] {
        dp[i][i+1] = true
    }
}

// 길이가 3이상인 경우
for L in 0..<n-2 {
    for i in 0..<(n-2-L) {
        let j = i+2+L
        if numbers[i] == numbers[j] && dp[i+1][j-1] {
            dp[i][j] = true
        }
    }
}

// 결과 출력
var answer = ""
let m = readInt()
for _ in 0..<m {
    let (s,e) = (readInt(), readInt())
    answer += dp[s-1][e-1] ? "1\n" : "0\n"
}

print(answer)