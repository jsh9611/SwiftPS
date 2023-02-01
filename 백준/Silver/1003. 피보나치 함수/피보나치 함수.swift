var dp_0 = [Int](repeating: 0, count: 41)
var dp_1 = [Int](repeating: 0, count: 41)

dp_0[0] = 1
dp_1[1] = 1

for i in 2...40 {
    dp_0[i] = dp_0[i-1] + dp_0[i-2]
    dp_1[i] = dp_1[i-1] + dp_1[i-2]
}

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    print(dp_0[n], dp_1[n])
}