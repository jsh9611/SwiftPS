var people = 0
var maxNumber = 0
for _ in 0..<4 {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    people += -input[0] + input[1]
    maxNumber = max(maxNumber,people)
}
print(maxNumber)