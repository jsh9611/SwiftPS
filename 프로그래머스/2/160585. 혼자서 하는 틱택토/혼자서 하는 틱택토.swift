import Foundation

func checkBingo(_ map: [[Character]]) -> Bool{
    var O_bingo = 0, X_bingo = 0
    var O_total = 0, X_total = 0
    
    // 가로
    for i in 0..<3 {
        var O_count = 0, X_count = 0

        for j in 0..<3 {
            if map[i][j] == "O" { O_count += 1 }
            if map[i][j] == "X" { X_count += 1 }
        }
        
        if O_count == 3 { O_bingo += 1 }
        if X_count == 3 { X_bingo += 1 }
        
        O_total += O_count
        X_total += X_count
    }
    //세로
    for j in 0..<3 {
        var O_count = 0, X_count = 0

        for i in 0..<3 {
            if map[i][j] == "O" { O_count += 1 }
            if map[i][j] == "X" { X_count += 1 }
        }
        
        if O_count == 3 { O_bingo += 1 }
        if X_count == 3 { X_bingo += 1 }
    }
    //대각선
    var O_count = 0
    var X_count = 0
    for i in 0..<3 {
        if map[i][i] == "O" { O_count += 1 }
        if map[i][i] == "X" { X_count += 1 }
    }
    if O_count == 3 { O_bingo += 1 }
    if X_count == 3 { X_bingo += 1 }

    O_count = 0
    X_count = 0
    
    for i in 0..<3 {
        if map[i][2-i] == "O" { O_count += 1 }
        if map[i][2-i] == "X" { X_count += 1 }
    }
    if O_count == 3 { O_bingo += 1 }
    if X_count == 3 { X_bingo += 1 }

    if (O_bingo > 0) && (X_bingo > 0) { return false }
    if (X_total > O_total) { return false }
    if O_total-X_total > 1 { return false }
    if X_bingo > 0 && O_total > X_total { return false }
    if O_bingo > 0 && O_total <= X_total { return false }
    
    return true
}

func solution(_ board:[String]) -> Int {
    let map = board.map{ Array($0) }
    return checkBingo(map) ? 1 : 0
}