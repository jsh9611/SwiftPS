let n = Int(readLine()!)!
var tupples = [(Int, Int)]()
for _ in 0..<n {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    tupples.append((input[0], input[1]))
}

let customSort: ((Int,Int), (Int,Int)) -> Bool = { a, b in
    if a.1 != b.1 {
        return a.1 < b.1
    }
    if a.0 != b.0 {
        return a.0 < b.0
    }
    return false
}

tupples.sort(by: customSort)

var answer = ""
for tupple in tupples {
    answer += "\(tupple.0) \(tupple.1)\n"
}

print(answer)