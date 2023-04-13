import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var arr = [Set<Int>](repeating: [], count: 9)
    var answer = 0
    for i in 1..<9 {
        for j in 1..<i {
            for s1 in arr[j] {
                for s2 in arr[i-j] {
                    arr[i].insert(s1 + s2)
                    arr[i].insert(s1 - s2)
                    arr[i].insert(s1 * s2)
                    if s1 != 0 && s2 != 0 {
                        arr[i].insert(s1 / s2)
                            
                    }
                }
            }
        }
        arr[i].insert(Int(String(repeating: "\(N)", count: i))!)
        
        if arr[i].contains(number) {
            return i
        }
    }
    return -1
}