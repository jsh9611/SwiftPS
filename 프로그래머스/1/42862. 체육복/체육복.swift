import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var lostSet = Set(lost)
    var reserveSet = Set(reserve)
    
    let sparseStolen = lostSet.intersection(reserveSet)
    lostSet = lostSet.subtracting(sparseStolen)
    reserveSet = reserveSet.subtracting(sparseStolen)
    
    for num in reserveSet.sorted() {
        if lostSet.contains(num-1) {
            lostSet = lostSet.subtracting(Set([num-1]))
        } else if lostSet.contains(num+1) {
            lostSet = lostSet.subtracting(Set([num+1]))
        }
    }

    return n - lostSet.count
}