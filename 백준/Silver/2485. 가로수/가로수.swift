let n = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    var temp = 0
    
    while b > 0 {
        temp = b
        b = a%b
        a = temp
    }
    return a
}

var g = gcd(arr[1]-arr[0], arr[2]-arr[1])
for i in 2..<(n-1) {
    g = gcd(g, arr[i+1]-arr[i])
}
print((arr[n-1] - arr[0]) / g - n + 1)