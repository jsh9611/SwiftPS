let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
let start = input[1]
let maxVolume = input[2]

let volumeList = readLine()!.split{ $0 == " " }.map{ Int($0)! }
var dp = [Set<Int>](repeating: [], count: n+1)

dp[0].insert(start)

for i in 1...n {
    for vol in dp[i-1] {
        if vol + volumeList[i-1] <= maxVolume {
            dp[i].insert(vol + volumeList[i-1])
        }
        
        if vol - volumeList[i-1] >= 0 {
            dp[i].insert(vol - volumeList[i-1])
        }
    }
}

print(dp[n].max() ?? -1)