import Foundation

let n = Int(readLine()!)!
var A = (readLine()!.split(separator: " ").map{Int($0)!}).sorted()
let m = Int(readLine()!)!
var M = readLine()!.split(separator: " ").map{Int($0)!}

func binarySearch(_ A: [Int], _ m: Int) -> Bool {
    var start = 0
    var end = A.count-1
    
    while start <= end {
        let mid = (start+end)/2
        if A[mid] == m {
            return true
        } else if A[mid] > m {
            end = mid-1
        } else {
            start = mid+1
        }
    }
    return false
}

for m in M {
    print(binarySearch(A, m) ? 1 : 0)
}