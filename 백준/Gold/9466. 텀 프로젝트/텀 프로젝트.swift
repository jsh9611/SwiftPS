for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let arr = [0] + readLine()!.split{ $0 == " " }.map{ Int($0)! }
    var visited = [Bool](repeating: false, count: n+1)
    var finish = [Bool](repeating: false, count: n+1)
    
    var answer = n

    for idx in 1...n {
        if !visited[idx] {
            dfs(idx)
        }
    }
    print(answer)

    func dfs(_ x: Int) {
        visited[x] = true
        let next = arr[x]

        if !visited[next] {
            dfs(next)
        } else {
            if !finish[next] {
                var i = next
                while i != x {
                    answer -= 1
                    i = arr[i]
                }
                answer -= 1
            }
        }
        finish[x] = true
    }
}