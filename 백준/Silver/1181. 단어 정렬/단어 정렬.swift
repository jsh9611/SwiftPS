let n = Int(readLine()!)!
var set = Set<String>()

for _ in 0..<n {
    set.insert(readLine()!)
}

let customSort: (String, String) -> Bool = { a, b in
    let ac = a.count, bc = b.count
    if ac != bc {
        return ac < bc
    } else {
        if a != b {
            return a < b
        }
    }
    return false
}

let answer = set.sorted(by: customSort)

print(answer.joined(separator: "\n"))