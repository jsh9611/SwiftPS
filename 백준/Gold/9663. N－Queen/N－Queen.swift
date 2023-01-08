func solution(_ n:Int) -> Int {
    // nqueen을 dfs로 구현
    func nqueen(col: Int) {
        // 모든 행에 퀸을 놓을 수 있다면 1을 더한다
        if col == n {
            count += 1
            return
        }

        for i in 0..<n {
            // 같은 열에 퀸이 이미 있는 경우 스킵한다
            if visited[i] {
                continue
            }
            board[col] = i
            // 대각선에 존재하지 않는 경우 해당 열을 방문처리하고 다음 행에 대해 진행한다.
            if isPlaceable(col) {
                visited[i] = true
                nqueen(col: col+1)
                visited[i] = false
            }
        }
    }
    // 퀸이 대각선상에 있는지 체크놓을 수 있는지 체크
    func isPlaceable(_ col: Int) -> Bool {
        for j in 0..<col {
            if abs(col - j) == (abs(board[col] - board[j])) {
                return false
            }
        }
        return true
    }
    // 퀸을 놓을 수 있는 보드를 만든다.
    // board[3] = 4 (4,3에 퀸이 놓여있다)
    var board: [Int] = Array(repeating: -1, count:15)

    // 열에 이미 방문했는지 확인하는 용도
    var visited: [Bool] = Array(repeating: false, count: 15)

    var count = 0
    nqueen(col: 0)
    return count
}

let n = Int(readLine()!)!
print(solution(n))