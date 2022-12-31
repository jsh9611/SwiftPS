let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    let cmd = readLine()!.split(separator: " ").map{($0)}
    switch cmd[0] {
    case "push":
        arr.append(Int(cmd[1])!)
    case "pop":
        if let last = arr.popLast() {
            print(last)
        } else {
            print(-1)
        }
    case "size":
        print(arr.count)
    case "empty":
        print(arr.isEmpty ? 1 : 0)
    case "top":
        if let top = arr.last {
            print(top)
        } else {
            print(-1)
        }
    default:
        print("ERROR!!")
    }
}