let str1 = readLine()!.map{ String($0) }
let str2 = readLine()!.map{ String($0) }

var LCS = [Int](repeating: 0, count: str1.count)

for ch2 in 0..<str2.count {

    var count = 0
    
    for ch1 in 0..<str1.count {
        if count < LCS[ch1] {
            count = LCS[ch1]
        } else if str1[ch1] == str2[ch2] {
            LCS[ch1] = count + 1
        }
    }
}

print(LCS.max()!)