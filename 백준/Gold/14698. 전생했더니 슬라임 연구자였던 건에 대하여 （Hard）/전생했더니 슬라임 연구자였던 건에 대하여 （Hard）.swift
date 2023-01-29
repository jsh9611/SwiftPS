let T = Int(readLine()!)!

for _ in 0..<T {
    let _ = Int(readLine()!)!
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    var heap = [Int]()
    
    var answer = 1
    for item in input {
        heap.append(item)
    }
    while heap.count > 1 {
        heap.sort(by: >)
        let t1 = heap.popLast()!
        let t2 = heap.popLast()!
        answer = (answer * ((t1 * t2) % 1000000007)) % 1000000007
        heap.append(t1*t2)
    }
    print(answer)
}