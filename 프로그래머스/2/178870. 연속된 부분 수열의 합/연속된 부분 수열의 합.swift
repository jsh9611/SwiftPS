import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
        
    var idx = 0
    let length = sequence.count
    
    var tempL = 0
    var tempR = 0
    
    var L = 0
    var R = length
    var sum = sequence[0]
    
    if sum == k {
        return [0,0]
    }
    
    while idx < length-1 {
        idx += 1
        tempR = idx
        sum += sequence[idx]
        
        while sum > k {
            sum -= sequence[tempL]
            tempL += 1
        }
        
        if sum == k {
            if (R-L) > (tempR-tempL) {
                L = tempL
                R = tempR
            }
        }
    }
    
    return [L,R]
}