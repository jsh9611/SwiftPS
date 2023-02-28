let _ = readLine()!
let answer = readLine()!.split{ $0 == " " }.map{ String($0) }.sorted{ $0+$1 > $1+$0 }
print(answer[0] == "0" ? 0 : answer.joined(separator: ""))