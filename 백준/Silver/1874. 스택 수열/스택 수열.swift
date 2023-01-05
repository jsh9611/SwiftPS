func solution() {
    let n = Int(readLine()!)!
    var cnt = 1
    var answer: [String] = []
    var stack: [Int] = []
    for _ in 0..<n {
        let num = Int(readLine()!)!
        
        while cnt <= num {
            stack.append(cnt)
            answer.append("+")
            cnt += 1
        }
        
        if stack.last == num {
            let _ = stack.popLast()
            answer.append("-")
        } else {
            print("NO")
            return
        }
    }

    print(answer.joined(separator: "\n"))
}

solution()