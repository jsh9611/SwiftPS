import Foundation

func permutation(_ target: [String], _ number: Int) -> [[String]] {
    let cnt = target.count
    
    var results = [[String]]()
    var check = [Bool](repeating: false, count: cnt)
    
    func permutate(_ arr: [String]) {
        if arr.count == number {
            results.append(arr)
            return
        }
        
        for i in 0..<cnt {
            if !check[i] {
                check[i] = true
                permutate(arr + [target[i]])
                check[i] = false
            }
        }
    }
    
    permutate([])
    return results
}

func checkString(_ a: String, _ b: String) -> Bool {
    if a.count != b.count {
        return false
    }
    let a = Array(a)
    let b = Array(b)
    for i in 0..<a.count {
        if b[i] != "*" && a[i] != b[i] {
            return false
        }
    }
    
    return true
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    let n = banned_id.count
    var answer = Set<[String]>()
    
    for cases in permutation(user_id, n) {
        var flag = true
        
        for i in 0..<n {
            if !checkString(cases[i], banned_id[i]) {
                flag = false
                break
            }
        }
        
        if flag {
            answer.insert(cases.sorted())
        }
    }
    
    return answer.count
}