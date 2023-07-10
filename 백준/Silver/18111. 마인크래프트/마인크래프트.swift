let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = input[0]
let b = input[2]

var blockData: [Int:Int] = [:]

for _ in 0..<n {
    let lane = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    for block in lane {
        if let _ = blockData[block] {
            blockData[block]! += 1
        } else {
            blockData[block] = 1
        }
    }
}

let start = blockData.keys.min()!
let end = blockData.keys.max()!

var ansTime = Int.max
var ansHeight = 0

for i in start...end {
    var tempTime = 0
    var tempBlock = b

    for j in blockData {
        let h = j.key
        let w = j.value
        
        if h>i {
            tempTime += (h-i) * w * 2
            tempBlock += (h-i) * w
        } else {
            tempTime += (i-h) * w
            tempBlock -= (i-h) * w
        }
    }
    
    if tempBlock >= 0 && ansTime >= tempTime {
        ansTime = tempTime
        ansHeight = i
    }
}

print(ansTime, ansHeight)