let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0]
let L = input[1]

var board = Array(repeating: [Int](), count: 100)
var parent = [Int]()
var rank = [Int]()

for i in 0..<N {
    board[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

func find(_ x: Int) -> Int {
    if parent[x] == x { return x }
    
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    var pa = find(a)
    var pb = find(b)

    parent[pb] = pa
    rank[pa] += 1       // 해당 구간의 길이를 더해준다.
}

func check(road: [Int]) -> Bool {
    parent = Array(0..<N)
    rank = Array(repeating: 1, count: N)

    for i in 0..<N-1 {
        if road[i] == road[i+1] {
            union(i, i+1)
        }
    }
    
    for i in 0..<N-1 {
        if find(i) == find(i+1) { continue }
        
        // 높이 차가 1보다 크면 불가능
        if abs(road[i] - road[i+1]) > 1 { return false }

        // 경사로를 놓을 곳을 구한다
        let nextIndex = road[i] > road[i+1] ? (i+1) : (i)
        
        // 해당 영역에서 경사로를 놓을 수 있는지 확인
        if rank[find(nextIndex)] >= L {
            rank[find(nextIndex)] -= L
        } else {
            return false
        }
    }
    
    return true
}


var count = 0
for i in 0..<N {
    let row = board[i]
    let col = (0..<N).map{ board[$0][i] }

    if check(road: row) { count += 1 }
    
    if check(road: col) { count += 1 }
}

print(count)