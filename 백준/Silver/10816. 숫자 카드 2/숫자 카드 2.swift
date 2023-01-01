let n = Int(readLine()!)!
let cards = readLine()!.split{ $0 == " " }.map{ String($0) }
let m = Int(readLine()!)!
let number = readLine()!.split{ $0 == " " }.map{ String($0) }

var dict: [String:Int] = [:]

for card in cards {
    if dict[card] != nil {
        dict[card]! += 1
    } else {
        dict[card] = 1
    }
}

var answer = ""

for item in number {
    if let cnt = dict[item] {
        answer += "\(cnt) "
    } else {
        answer += "0 "
    }
}

print(answer)