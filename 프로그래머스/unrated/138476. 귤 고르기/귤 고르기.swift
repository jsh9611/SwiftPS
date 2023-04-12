import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tangerine = tangerine.sorted()
    var box = [Int:Int]()
    for t in tangerine {
        if box[t] == nil {
            box[t] = 1
        } else {
            box[t] = box[t]! + 1
        }
    }
    
    let cnt = box.values.sorted(by: >)
    var target = k
    
    for i in 0..<cnt.count {
        target -= cnt[i]
        if target <= 0 {
            return (i+1)
        }
    }
    return 0
}

