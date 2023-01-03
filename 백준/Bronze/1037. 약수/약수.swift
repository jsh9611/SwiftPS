let _ = readLine()
let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
print(input.min()! * input.max()!)