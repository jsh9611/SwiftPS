for _ in 0..<Int(readLine()!)! {
    var result = 1
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    var idx = input[1]
    var printer = readLine()!.split(separator: " ").map{ Int($0)! }

    while !printer.isEmpty {
        if printer.first == printer.max() {
            if idx == 0 {
                break
            }
            printer.removeFirst()
            idx -= 1
            result += 1
        } else {
            printer.append(printer.removeFirst())
            idx = idx == 0 ? printer.endIndex-1 : idx - 1
        }
    }
    
    print(result)
}