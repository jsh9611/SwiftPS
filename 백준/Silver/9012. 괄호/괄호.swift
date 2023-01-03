let n = Int(readLine()!)!
var answer = ""
for _ in 0..<n {
    var input = readLine()!
    var left = 0, right = 0
    var isNO = false
    while !input.isEmpty {
        if let temp = input.popLast() {
            if temp == ")" {
                right += 1
            } else {
                left += 1
            }
            if left > right {
                isNO = true
                break
            }
        }
    }
    
    if isNO {
        answer += "NO\n"
    } else {
        if left != right {
            answer += "NO\n"
        } else {
            answer += "YES\n"
        }
    }
}

print(answer)