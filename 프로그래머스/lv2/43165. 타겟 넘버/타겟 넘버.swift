import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var dict = [0 : 1]
    
    for number in numbers {
        var temp = [Int:Int]()
        for key in dict.keys {
            if temp[key + number] == nil {
                temp[key + number] = dict[key]!
            } else {
                temp[key + number]! += dict[key]!
            }
            
            if temp[key - number] == nil {
                temp[key - number] = dict[key]!
            } else {
                temp[key - number]! += dict[key]!
            }
        }
        dict = temp
    }
    return dict[target] ?? 0
}