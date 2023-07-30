let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let arr = readLine()!.split{ $0 == " " }.reversed().map{ Int($0)! }
    
    var sum = 0
    var temp = arr[0]
    
    for i in 1..<n {
        if temp > arr[i] {
            sum += temp - arr[i]
        } else {
            temp = arr[i]
        }
    }
    
    print(sum)
}