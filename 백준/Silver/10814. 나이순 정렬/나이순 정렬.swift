let n = Int(readLine()!)!
var arr = [[String]]()
for _ in 0..<n {
    arr.append(readLine()!.split { $0 == " " }.map { String($0) })
}
arr.sort { Int($0[0])! < Int($1[0])! }
var answer = ""
for item in arr {
    answer += "\(item[0]) \(item[1])\n"
}
print(answer)