let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
var k = input[1]

var coin = [Int]()
for _ in 0..<n {
    coin.append(Int(readLine()!)!)
}

var answer = 0
while !coin.isEmpty {
    let c = coin.popLast()!
    answer += k/c
    k = k%c
    if k == 0 {
        break
    }
}
print(answer)