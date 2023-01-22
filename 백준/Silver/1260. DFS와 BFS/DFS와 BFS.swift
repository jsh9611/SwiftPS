let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }

let n = input[0]
let m = input[1]
let v = input[2]

var arr = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
var visited = Array(repeating: false, count: n+1)

for _ in 0..<m {
    let t = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    arr[t[0]][t[1]] = 1
    arr[t[1]][t[0]] = 1
}

var dfsCheck = false
func dfs(_ v: Int) {
    visited[v] = true
    
    print(v, terminator: " ")
    
    for i in 0...n {
        if !visited[i], arr[v][i] == 1 {
            dfs(i)
        }
    }
}
dfs(v)
print()
struct Queue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    mutating func enqueue(_ input: T) {
        inbox.append(input)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func bfs(_ v: Int) {
    var visited = [Int]()
    var queue = Queue<Int>()
    
    queue.enqueue(v)
    
    while !queue.isEmpty {
        let node = queue.dequeue()!
        
        if !visited.contains(node) {
            visited.append(node)
            for i in 0...n where arr[node][i] > 0 {
                arr[node][i] = 0
                arr[i][node] = 0
                queue.enqueue(i)
            }
        }
    }
    print(visited.map { String($0) }.joined(separator: " "))
}
bfs(v)