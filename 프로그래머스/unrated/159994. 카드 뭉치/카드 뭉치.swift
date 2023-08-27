import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var idx1 = 0
    var idx2 = 0
    
    let max1 = cards1.count
    let max2 = cards2.count
    
    for word in goal {
        if idx1 < max1 && cards1[idx1] == word {
            idx1 += 1
        } else if idx2 < max2 && cards2[idx2] == word {
            idx2 += 1
        } else {
            return "No"
        }
    }

    return "Yes"
}