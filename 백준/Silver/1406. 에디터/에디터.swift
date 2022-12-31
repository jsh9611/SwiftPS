var leftSide = Array(readLine()!)
var rightSide: [Character] = []

for _ in 0..<Int(readLine()!)! {
    var cmd = readLine()!
    
    switch cmd {
    case "L":
        if !leftSide.isEmpty { rightSide.append(leftSide.removeLast()) }
    case "D":
        if !rightSide.isEmpty { leftSide.append(rightSide.removeLast()) }
    case "B":
        if !leftSide.isEmpty { leftSide.removeLast() }
    default:  // case "P $":
        leftSide.append(cmd.last!)
    }
}
print(String(leftSide + rightSide.reversed()))