let n = Int(readLine()!)!
let drink = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let max = Double(drink.max()!)
let answer = (Double(drink.reduce(0, +)) - max)/2 + max
print(Int(answer*10)%10 == 0 ? Int(answer) : answer)