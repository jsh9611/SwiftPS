var leftSide = readLine()!
var rightSide = ""

for _ in 0..<Int(readLine()!)! {
    let cmd = readLine()!
    
    switch cmd.first! {
    case "L":
        if !leftSide.isEmpty { rightSide.append(leftSide.popLast()!) }
    case "D":
        if !rightSide.isEmpty { leftSide.append(rightSide.popLast()!) }
    case "B":
        if !leftSide.isEmpty { let _ = leftSide.popLast()! }
    default:  // case "P $":
        leftSide.append(cmd.last!)
    }
}

print("\(leftSide)\(String(rightSide.reversed()))")