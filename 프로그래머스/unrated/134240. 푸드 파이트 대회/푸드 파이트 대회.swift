import Foundation

func solution(_ food:[Int]) -> String {
    var front = ""
    var back = ""
    for idx in 1..<food.count {
        for _ in 0..<food[idx]/2 {
            front =  front + String(idx)
            back = String(idx) + back
        }
    }
    return front + "0" + back
}