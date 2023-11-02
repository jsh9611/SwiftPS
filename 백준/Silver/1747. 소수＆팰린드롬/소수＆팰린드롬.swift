import Foundation

func isPrime(_ num: Int) -> Bool {
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}

let n = Int(readLine()!)!

for num in n...Int.max {
    if isPrime(num) {
        let str = String(num)
        if str == String(str.reversed()) {
            print(str)
            break
        }
    }
}