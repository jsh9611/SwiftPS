import Foundation

func solution(_ input_array:[String]) -> Int
{
    var nowMin = 0
    var nowMax = 0
    var sum = 0
    var lastNumber = 0
    
    for str in input_array.reversed() {
        if str == "-" {
            let tempMax = nowMax
            let tempMin = nowMin
            nowMax = max(-tempMin - sum, tempMax + sum - (2 * lastNumber))
            nowMin = min(-tempMax, tempMin) - sum
            sum = 0
            lastNumber = 0
        } else if str == "+" {
            continue
        } else {
            lastNumber = Int(str)!
            sum += lastNumber
        }   
    }
    nowMax += sum
    return nowMax
}