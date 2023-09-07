let n = Int(readLine()!)!

var chart = [[Int]]()
var income = [Int](repeating: 0, count: n+1)
for _ in 0..<n {
    chart.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var maxIncome = 0
for idx in (0..<n).reversed() {
    let nextTime = idx + chart[idx][0]
    let money = chart[idx][1]
    
    if nextTime > n {
        income[idx] = maxIncome
        continue
    }
    
    income[idx] = max(money + income[nextTime], maxIncome)
    maxIncome = income[idx]
}

print(maxIncome)