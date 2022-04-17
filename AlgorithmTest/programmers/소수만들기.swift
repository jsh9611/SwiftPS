import Foundation

func isPrime(num: Int) -> Bool {
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) {
            return false
        }
    }
    return true
}



func solution(_ nums:[Int]) -> Int {
    var answer = 0
    let n = nums.count
    var combination = [[Int]]()
    
    for i in 0..<n {
        for j in (i+1)..<n {
            for k in (j+1)..<n {
//                combination.append([nums[i], nums[j], nums[k]])
                if isPrime(num: nums[i]+nums[j]+nums[k]) {
                    answer += 1
                }
            }
        }
    }
    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    
    return answer
}

// https://programmers.co.kr/learn/courses/30/lessons/12977
// 프로그래머스 
// 소수 만들기
