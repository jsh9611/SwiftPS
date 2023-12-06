import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    
    zip(A.sorted(),B.sorted(by: >)).forEach {
        ans += $0.0 * $0.1
    }
    
    return ans
}