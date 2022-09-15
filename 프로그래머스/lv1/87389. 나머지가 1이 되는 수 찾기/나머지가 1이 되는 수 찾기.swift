import Foundation

func solution(_ n:Int) -> Int {
    for idx in 2...1000000 {
        if n%idx == 1 {
            return idx
        }
    }
    return 0
}