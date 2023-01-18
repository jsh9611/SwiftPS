func eratosthenes(_ n: Int) -> [Bool] {
     var arr = [Bool](repeating: true, count: n+1)
     for i in 2...n {
          if i*i >= n {
               break
          }
         
          if arr[i] {
               for j in stride(from: i*i, to: n+1, by: i) {
                    if arr[j] {
                         arr[j] = false
                    }
               }
          }
     }
     return arr
}

let isPrime = eratosthenes(1000000)
while true {
    let n = Int(readLine()!)!
    if n == 0 {
        break
    }

    for i in stride(from: 3, to: n+1, by: 2) {
        if isPrime[i], isPrime[n-i] {
            print("\(n) = \(i) + \(n-i)")
            break
        }
    }
}
