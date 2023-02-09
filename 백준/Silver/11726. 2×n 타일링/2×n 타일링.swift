var a = 1, b = 1, c = 0
for _ in 0..<Int(readLine()!)! {
    c = b
    b = a + b
    a = c%10007
}
print(a)