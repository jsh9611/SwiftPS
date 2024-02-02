let str = Array(readLine()!).map{ String($0) }
let target = readLine()!
let targetLast = String(target.last!)
let targetLen = target.count

var stack = [String]()

for char in str {
    stack.append(char)
    
    if char == targetLast {
        let nowLen = stack.count
        
        if nowLen >= targetLen && stack[(nowLen - targetLen)...].joined() == target {
            for _ in 0..<targetLen {
                _ = stack.popLast()
            }
        }
    }
}

let answer = stack.joined()
print(answer.isEmpty ? "FRULA" : answer)