import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var mapping: [String:Int] = [:]
    for key in keymap {
        let temp = key.map({ String($0) })
        for idx in 0..<temp.count  {
            mapping[temp[idx]] = min(idx+1, mapping[temp[idx]] ?? 101)
        }
    }
    
    var answer = [Int]()
    for target in targets {
        var cnt = 0
        for char in target {
            if mapping[ String(char) ] == nil {
                cnt = -1
                break
            }
            
            cnt += mapping[ String(char) ]!
        }
        answer.append(cnt)
    }
    
    return answer
}


// ABACD/BCEFD
// A 1
// B 1
// C 2
// D 5
// E 3
// F 4