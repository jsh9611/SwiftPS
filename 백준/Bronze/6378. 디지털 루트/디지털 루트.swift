while true {
    var number = Array(readLine()!).map{ Int(String($0))! }.reduce(0, +)
    if number == 0 {
        break
    }
    
    while number >= 10 {
        number = Array(String(number)).map{ Int(String($0))! }.reduce(0, +)
    }
    print(number)
}