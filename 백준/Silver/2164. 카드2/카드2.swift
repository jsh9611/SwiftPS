import Foundation

var n = Int(readLine()!)!
var a = 1
var b = n
var cnt = 0
while n > 1 {
    if n%2 == 1 {
        b = a + Int(pow(Float(2), Float(cnt)))
        a += 3 * Int(pow(Float(2), Float(cnt)))
    } else {
        a += Int(pow(Float(2), Float(cnt)))
    }
    n /= 2
    cnt += 1
}
print(b)