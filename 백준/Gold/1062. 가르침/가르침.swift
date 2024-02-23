let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, k) = (input[0], input[1])

var words = [Int](repeating: 0, count: n)
var spells = 0
var answer = 0

func spellNumber(_ s: String) -> Int {
    return Int(Character(s).asciiValue! - Character("a").asciiValue!)
}

func dfs(_ depth: Int, _ now: Int) {
    if depth == k-5 {
        var count = 0
        for word in words {
            if (word & spells) == word {
                count += 1
            }
        }
        answer = max(answer, count)
        return
    }
    
    for idx in now..<26 {
        if spells & (1<<idx) == 0 {
            spells |= (1<<idx)
            dfs(depth+1, idx)
            spells &= ~(1<<idx)
        }
    }
}

for i in 0..<n {
    readLine()!.map{String($0)}.forEach {
        words[i] |= 1 << ( spellNumber($0) )
    }
}

if k >= 5 {
    spells |= 1 << spellNumber("a")
    spells |= 1 << spellNumber("n")
    spells |= 1 << spellNumber("t")
    spells |= 1 << spellNumber("i")
    spells |= 1 << spellNumber("c")
    
    dfs(0, 0)
}

print(answer)