let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])

var words = [Int](repeating: 0, count: N)
var check = 0
var answer = ""

func spellNumber(_ s: String) -> Int {
    return Int(Character(s).asciiValue! - Character("a").asciiValue!)
}

for i in 0..<N {
    readLine()!.map{ String($0) }.forEach{
        let spell = spellNumber($0)
        words[i] |= 1 << ( spellNumber($0) )
        check |= 1 << (spellNumber($0))
    }
}

for j in 0..<M {
    let query = readLine()!.split(separator: " ").map{ String($0) }
    if query[0] == "1" {
        // 잊는다
        if !["a", "e", "i", "o", "u"].contains(query[1]) {
            check &= ~(1<<spellNumber(query[1]))
        }
        
        var count = 0
        for word in words {
            if word & check == word {
                count += 1
            }
        }
        answer += "\(count)\n"
        
    } else {
        // 기억한다
        check |= (1<<spellNumber(query[1]))
        
        var count = 0
        for word in words {
            if word & check == word {
                count += 1
            }
        }
        answer += "\(count)\n"
    }
}

print(answer)