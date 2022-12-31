let n = Int(readLine()!)!
var A = (readLine()!.split(separator: " ").map{Int($0)!}).sorted()
let m = Int(readLine()!)!
var M = readLine()!.split(separator: " ").map{Int($0)!}

func binarySearch(_ A: [Int], _ m: Int) -> Bool {
    var left = 0
    var right = A.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        if A[mid] > m {
            right = mid - 1
        } else if A[mid] < m {
            left = mid + 1
        } else {
            return true
        }
    }
    return false
}

var answer = ""

for m in M {
    answer += binarySearch(A, m) ? "1 " : "0 "
}

print(answer)