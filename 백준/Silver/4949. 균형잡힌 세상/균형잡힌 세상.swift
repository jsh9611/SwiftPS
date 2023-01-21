var answer = ""
while true {
    let str = readLine()!
    
    if str == "." {
        break
    }

    var stack = [String]()
    var isBlanced = true
    
    for c in str {
        if c == "[" {
            stack.append("[")
        } else if c == "]" {
            if stack.popLast() != "[" {
                isBlanced = false
                break
            }
        } else if c == "(" {
            stack.append("(")
        } else if c == ")" {
            if stack.popLast() != "(" {
                isBlanced = false
                break
            }
        }
    }

    if !stack.isEmpty || !isBlanced {
        answer += "no\n"
    } else {
        answer += "yes\n"
    }
}
print(answer)