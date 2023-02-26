func solution() -> Bool {
    let cn = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    let c = cn[0]
    let n = cn[1]

    var train = 0
    
    for _ in 0..<n {
        let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
        let left = input[0]
        let enter = input[1]
        let stay = input[2]
        
        if left > train { return false }
        
        train += enter - left
        
        if train < 0 { return false }
        if train > c { return false }
        if train < c && stay > 0 { return false }
    }
    return train == 0
}

print(solution() ? "possible" : "impossible")