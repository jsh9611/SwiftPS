let n = Int(readLine()!)!
var tips = [Int]()

for _ in 0..<n {
    tips.append(Int(readLine()!)!)
}

tips.sort(by: >)

var ans = 0
for i in 0..<n {
    let money = tips[i] - i
    
    if money > 0 {
        ans += money
    }
}

print(ans)