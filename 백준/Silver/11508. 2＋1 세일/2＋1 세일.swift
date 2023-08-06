let n = Int(readLine()!)!
var dairy = [Int]()

for _ in 0..<n {
    dairy.append(Int(readLine()!)!)
}

dairy.sort(by: >)

var ans = 0
for i in 0..<n {
    
    if (i % 3) == 2 {
        continue
    }
    
    ans += dairy[i]
}

print(ans)