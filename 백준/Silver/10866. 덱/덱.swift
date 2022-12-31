var arr: [String] = []
var answer = ""
for _ in 0..<Int(readLine()!)! {
    let cmd = readLine()!.split{ $0 == " " }.map{ String($0) }
    
    switch cmd[0] {
    case "push_front":
        arr = (arr.reversed() as [String])
        arr.append(cmd[1])
        arr = arr.reversed() as [String]
    case "push_back":
        arr.append(cmd[1])
    case "pop_front":
        if !arr.isEmpty {
            arr = (arr.reversed() as [String])
            answer += "\(arr.popLast()!)\n"
            arr = arr.reversed() as [String]
        } else {
            answer += "-1\n"
        }
    case "pop_back":
        answer += "\(arr.isEmpty ? "-1" : arr.popLast()!)\n"
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