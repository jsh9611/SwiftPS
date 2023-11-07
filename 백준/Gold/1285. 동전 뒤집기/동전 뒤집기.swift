import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)
var index: Int = 0

@inline(__always) func readString() -> String {
    var str = ""
    var now = read()
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    
    while now != 10
            && now != 32 && now != 0 {
        str += String(bytes: [now], encoding: .ascii)!
        now = read()
    }
    
    return str
}

@inline(__always) private func read() -> UInt8 {
    defer { index += 1 }

    return buffer[index]
}

func convertBinary(_ str: String) -> Int {
    var mask = 1 << (str.count-1)
    var result = 0
    for char in str {
        if char == "T" {
            result |= mask
        }
        mask = mask >> 1
    }
    return result
}

func countOnes(_ n: Int) -> Int {
    var num = n
    var count = 0
    while num > 0 {
        if num % 2 == 1 {
            count += 1
        }
        num = num>>1
    }
    
    return count
}

let n = Int(readString())!
var coins = [Int]()
for _ in 0..<n {
    coins.append(convertBinary(readString()))
}

// 1<<n = 열을 뒤집을 모든 경우의 수
// flip = 뒤집힌 열
// 특정 열들을 뒤집었을 때 각 행의 최소가 되는 T를 더한다. (H = n-T)
// T가 가장 적은 경우의 수를 구한다.
var answer = n*n
for flip in 0..<(1<<n) {
    var result = 0
    for i in 0..<n {
        let t = countOnes(coins[i] ^ flip)
        result += min(t, n-t)
    }
    answer = min(answer, result)
    if answer == 0 { break }
}

print(answer)