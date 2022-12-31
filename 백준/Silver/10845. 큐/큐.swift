var arr: [String] = []
var answer = ""
for _ in 0..<Int(readLine()!)! {
    let cmd = readLine()!.split{ $0 == " " }.map{ String($0) }
    
    switch cmd[0] {
    case "push":
        arr.append(cmd[1])
    case "pop":
        if !arr.isEmpty {
            arr = (arr.reversed() as [String])
            answer += "\(arr.popLast()!)\n"
            arr = arr.reversed() as [String]
        } else {
            answer += "-1\n"
        }
    case "size":
        answer += "\(arr.count)\n"
    case "empty":
        answer += "\(arr.isEmpty ? 1 : 0)\n"
    case "front":
        answer += "\(arr.isEmpty ? "-1" : arr[0])\n"
    default:    // case "back":
        answer += "\(arr.isEmpty ? "-1" : arr.last!)\n"
    }
}
print(answer)