let MAX = 2000002
var primes: [Int] = []
var isPrime = [Bool](repeating: true, count: MAX+1)

func checkPrime(_ value: Int) -> Bool {
    if value > MAX {
        for prime in primes {
            if prime >= value {
                break
            } else if value % prime == 0 {
                return false
            }
        }
        return true
    } else {
        return isPrime[value]
    }
}

for i in 2..<MAX+1 {
    if isPrime[i] {
        primes.append(i)
        for j in stride(from: i*i, to: MAX+1, by: i) {
            isPrime[j] = false
        }
    }
}

var bands: [Int] = []
for _ in 0..<Int(readLine()!)! {
    let band = readLine()!.split{ $0 == " " }.map{ Int($0)! }.reduce(0, +)
    if band < 4 {
        print("NO")
    } else if band % 2 == 0 {
        print("YES")
    } else if checkPrime(band - 2) {
        print("YES")
    } else {
        print("NO")
    }
}