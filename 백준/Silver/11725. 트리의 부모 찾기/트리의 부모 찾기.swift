let n = Int(readLine()!)!
var visited = [Int](repeating: 0, count: n+1)
var tree = [Int:[Int]]()
for i in 1...n {
    tree[i] = []
}

for _ in 0..<n-1 {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    tree[input[0]]!.append(input[1])
    tree[input[1]]!.append(input[0])
}

func dfs(_ node: Int) {
    for next in tree[node]! {
        if visited[next] == 0 {
            visited[next] = node
            dfs(next)
        }
    }
}

dfs(1)

for i in 2...n {
    print(visited[i])
}