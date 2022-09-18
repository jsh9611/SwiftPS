import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var out : [Int] = []
    var answer = 0
    for move in moves {
        for i in 0..<board.count {
            if board[i][move-1] != 0 {
                if out.last != nil && out.last == board[i][move-1] {
                    out.popLast()
                    answer += 2
                } else {
                    out.append(board[i][move-1])
                }
                board[i][move-1] = 0
                break
            }
        }
    }
    return answer
}