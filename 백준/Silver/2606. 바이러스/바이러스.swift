let node = Int(readLine()!)!
let edge = Int(readLine()!)!

var network = [[Int]](repeating: [Int](), count: node+1)
var visited = [Bool](repeating: false, count: node+1)
var count = 0

for _ in 0..<edge {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    network[input[0]].append(input[1])
    network[input[1]].append(input[0])
}

func dfs(_ v: Int) {
    visited[v] = true
    
    if v != 1 {
        count += 1
    }
    
    for next in network[v] {
        if !visited[next] {
            dfs(next)
        }
    }
}
dfs(1)
print(count)