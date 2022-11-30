func solution(_ arr:[Int]) -> [Int] {
    var arr = arr
    if let minNumber = arr.min() { 
        if let minNumIndex = arr.firstIndex(of: minNumber) {            
            arr.remove(at: minNumIndex)
            if arr.isEmpty {
                return [-1]
            }
            return arr
        }
    }
    return []   
}
