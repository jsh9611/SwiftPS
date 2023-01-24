let L = readLine()!.map { String($0) }
for i in 0..<L.count {
    let t = String(Int(L[i], radix: 8)!, radix: 2)
    if i == 0 {
        print(t, terminator: "")
    } else {
        print(String(repeating: "0", count: 3-t.count)+t,terminator: "")
    }
}