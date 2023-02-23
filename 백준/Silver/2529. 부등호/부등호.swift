let n = Int(readLine()!)!
let inequality = readLine()!.split{ $0 == " " }.map{ String($0) }

var list = [Int]()
var answer = [String]()
var visited = [Bool](repeating: false, count: 10)

func dfs(_ depth: Int, _ last: Int) {
    if depth == n+1 {
        answer.append(list.map{ String($0) }.joined())
        return
    }
    
    for idx in 0..<10 {
        if !visited[idx] {
            if depth > 0 {
                if last <= idx && inequality[depth-1] == ">" { continue }
                if last >= idx && inequality[depth-1] == "<" { continue }
            }
            visited[idx] = true
            list.append(idx)
            dfs(depth + 1, idx)
            visited[idx] = false
            let _ = list.popLast()!
        }
    }
    
}

dfs(0, 0)
print(answer.max()!)
print(answer.min()!)