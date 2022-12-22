import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesType: [String:Int] = [:]
    for cloth in clothes {
        if clothesType[cloth[1]] != nil {
            clothesType[cloth[1]]! += 1
        } else {
            clothesType[cloth[1]] = 1
        }
    }
    
    var count = 1
    for val in clothesType {
        count *= val.1 + 1
    }
    return count - 1
}