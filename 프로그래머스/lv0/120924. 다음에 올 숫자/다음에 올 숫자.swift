import Foundation

func solution(_ common:[Int]) -> Int {
    var numbers = common
    let lastFirst = numbers.popLast()!
    let lastSecond = numbers.popLast()!
    let lastThird = numbers.popLast()!
    if (lastFirst - lastSecond) == (lastSecond - lastThird) {
        return lastFirst + lastFirst - lastSecond
    } else {
        let gongB = min(lastFirst/lastSecond, lastSecond/lastThird)
        return lastFirst * gongB
    }
    
    
    return 0
}