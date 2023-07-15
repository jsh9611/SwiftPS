let n = Int(readLine()!)!
var status = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    let gender = input[0]
    let s = input[1] - 1
    
    status[s] = status[s] ^ 1
    
    if gender == 1 {
        var alpha = s + 1
        while true {
            if s + alpha >= n {
                break
            }
            status[s + alpha] = status[s + alpha] ^ 1
            alpha += s + 1
        }
    } else {
        var alpha = 1
        while true {
            if (s - alpha < 0) || (s + alpha) >= n {
                break
            }
            
            if status[s - alpha] != status[s + alpha] {
                break
            }
            
            status[s - alpha] = status[s - alpha] ^ 1
            status[s + alpha] = status[s + alpha] ^ 1
            alpha += 1
        }
    }
}

for i in 0..<n {
    if i > 0 && i%20 == 0 {
        print()
    }
    print(status[i], terminator: " ")
}