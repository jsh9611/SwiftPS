import Foundation

let n = Int(readLine()!)!
var pack = readLine()!.split(separator: " ").map{Int($0)!}
var cost = [Int](repeating: 0, count: n)

for i in 0..<n {
    var max = pack[i]
    for j in 0..<i {
        if (cost[i-j-1] + pack[j]) > max {
            max = cost[i-j-1] + pack[j]
        }
    }
    cost[i] = max
}

print(cost[n-1])