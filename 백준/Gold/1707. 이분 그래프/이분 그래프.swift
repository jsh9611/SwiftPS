let K = Int(readLine()!)!
for _ in 0..<K {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (V, E) = (input[0], input[1])
    
    var color = [Bool](repeating: false, count: V+1) // false: 청기, true: 백기
    var visited = [Bool](repeating: false, count: V+1)
    var graph = [[Int]](repeating: [], count: V+1)
    var isBipartite = true
    
    for _ in 0..<E {
        let info = readLine()!.split(separator: " ").map{ Int($0)! }
        let (u, v) = (info[0], info[1])
        
        graph[u].append(v)
        graph[v].append(u)
    }
    
    func dfs(_ now: Int) {
        visited[now] = true
        
        for next in graph[now] {
            if !visited[next] {
                // now와 다른 색을 다음 노드에 칠한다.
                color[next] = !color[now]
                dfs(next)
                
            } else if color[now] == color[next] {
                // now와 next가 같은 색을 가리키는 경우 이분 그래프 X
                isBipartite.toggle()
                return
            }
        }
    }
    
    for node in 1...V {
        if !isBipartite { break }
        dfs(node)
    }
    
    print(isBipartite ? "YES" : "NO")
}