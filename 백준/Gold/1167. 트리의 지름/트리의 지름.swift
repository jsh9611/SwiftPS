let n = Int(readLine()!)!
var maxDist = 0
var maxNode = 0
var check = true

var tree = [[(Int,Int)]](repeating: [], count: n+1)
var visited = [Bool](repeating: !check, count: n+1)

for _ in 0..<n {
    var input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let root = input[0]
    let _ = input.popLast()!
    while input.count > 2 {
        let dist = input.popLast()!
        let node = input.popLast()!
        tree[root].append((node,dist))
    }
}

func dfs(_ node: Int, _ dist: Int) {
    if visited[node] == check {
        return
    }
    
    if maxDist < dist {
        maxDist = dist
        maxNode = node
    }
    
    visited[node] = check
    for nextNode in tree[node] {
        let nextIdx = nextNode.0
        let nextDist = nextNode.1
        dfs(nextIdx, nextDist + dist)
    }
}

dfs(1,0)
check.toggle()
maxDist = 0
dfs(maxNode, 0)
print(maxDist)