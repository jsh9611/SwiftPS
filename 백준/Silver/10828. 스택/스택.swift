var arr: [String] = []
for _ in 0..<Int(readLine()!)! {
    let cmd = readLine()!.split{ $0 == " " }.map{ String($0) }
    
    switch cmd[0] {
    case "push": arr.append(cmd[1])
    case "pop": print(arr.isEmpty ? -1 : arr.removeLast())
    case "size": print(arr.count)
    case "empty": print(arr.isEmpty ? 1 : 0)
    default: print(arr.isEmpty ? -1 : arr.last!)
    }
}