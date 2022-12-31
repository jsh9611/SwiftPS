let n = Int(readLine()!)!

var numbers = (0..<n).map {_ in
    Int(readLine()!)!
}

numbers.sort()

for num in numbers {
    print(num)
}