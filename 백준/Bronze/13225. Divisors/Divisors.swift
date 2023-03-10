var answer = ""
for _ in 0..<Int(readLine()!)! {
    let number = Int(readLine()!)!
    var idx = 1
    var cnt = 0
    while idx*idx <= number {
        if idx*idx == number { cnt += 1 }
        else if number % idx == 0 { cnt += 2 }
        idx += 1
    }
    answer += "\(number) \(cnt)\n"
}
print(answer)