let t = Int(readLine()!)!
var answer = ""
for _ in 0..<t {
    let p = readLine()!
    let n = Int(readLine()!)!
    let arr = (readLine()!.dropFirst().dropLast()).split(separator: ",").map{ String($0) }
    
    var left = 0
    var right = n - 1
    var isReversed = false
    var isError = false
    
    for cmd in p {
        if cmd == "D" {
            if left > right {
                isError = true
                break
            }
            if isReversed {
                right -= 1
            } else {
                left += 1
            }
        } else {
            isReversed.toggle()
        }
    }
    
    if isError {
        print("error")
    } else if left > right {
        print("[]")
    } else {
        let ans = arr[left...right].map{ String($0) }.joined(separator: ",")
        let reverseAns = arr[left...right].reversed().map{ String($0) }.joined(separator: ",")
        if isReversed {
            print("[\(reverseAns)]")
        } else {
            print("[\(ans)]")
        }
    }
}