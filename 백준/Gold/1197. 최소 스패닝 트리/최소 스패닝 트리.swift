let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (V,E) = (input[0],input[1])

var disjoint = Array(0...V)

// union find를 이용해 같은 집합(연결된 적이 있는지) 확인
func find(_ x: Int) -> Int {
    if x == disjoint[x] {
        return x
    }
    
    // 경로 압축을 통해 루트 노드를 더 빠르게 찾도록 함
    disjoint[x] = find(disjoint[x])
    return disjoint[x]
}

// 간선의 정보를 입력받음
var edges = [[Int]]()
for _ in 0..<E {
    edges.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

// 가중치가 적은 간선을 우선 방문하기 위해 정렬
edges.sort{ $0[2] < $1[2] }

// 최소로 연결했을 때의 가중치
var weight = 0

for edge in edges {
    let (A,B,W) = (edge[0],edge[1],edge[2])
    
    let pA = find(A)
    let pB = find(B)
    
    // 두 정점이 연결되지 않은 경우에 숫자가 더 작은 것을 기준으로 연결
    if pA != pB {
        if pA > pB {
            disjoint[pA] = pB
        } else {
            disjoint[pB] = pA
        }
        
        weight += W
    }
}

print(weight)