import Foundation

func makeZeroPaddingBinary(_ n: Int64) -> [Character] {
    let binary = String(n, radix: 2)
    let binaryLength = binary.count
    
    var digit = 1
    var cnt = 0
    
    while digit <= binaryLength {
        digit *= 2
        cnt += 1
    }
    
    return [Character](repeating: "0", count: digit-1-binaryLength) + binary
}

func check(_ binary: [Character]) -> Bool {
    let count = binary.count

    if count == 1 {
        return true
    }
    
    let left = Array(binary[0..<count/2])
    let middle = binary[count/2]
    let right = Array(binary[(count/2+1)...])
    
    if middle == "0" {
        return !left.contains("1") && !right.contains("1")
    }
    
    return check(left) && check(right)
}

func solution(_ numbers:[Int64]) -> [Int] {
    var answer: [Int] = []
    
    
    numbers.forEach {
        let formattedBinary = Array(makeZeroPaddingBinary($0))
        check(formattedBinary) ? answer.append(1) : answer.append(0)
    }
    
    return answer
}