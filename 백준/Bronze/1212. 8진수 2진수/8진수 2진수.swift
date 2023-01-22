let input = readLine()!.map { String($0) }
for i in 0..<input.count {
    let t = String(Int(input[i], radix: 8)!, radix: 2)
    if i == 0 {
        print(t, terminator: "")
    } else {
        print(String(repeating: "0", count: 3-t.count)+t,terminator: "")
    }
}