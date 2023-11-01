let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n,m) = (input[0],input[1])
var arr = [[Int]]()
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(line)
}

// 아래로 한칸
/// 오른쪽 4칸
let S1 = [(0,0), (1,0), (2,0), (3,0)]

// 아래로 두칸
/// 오른쪽 2칸
let B1 = [(0,0), (0,1), (1,1), (1,0)]
/// 오른쪽 3칸
let RZ1 = [(1,0), (2,0), (0,1), (1,1)],
    LZ1 = [(0,0), (1,0), (1,1), (2,1)],
    RL1 = [(0,0), (0,1), (1,1), (2,1)],
    RL2 = [(0,0), (1,0), (2,0), (2,1)],
    L1 = [(0,0), (1,0), (2,0), (0,1)],
    L2 = [(0,1), (1,1), (2,1), (2,0)],
    T1 = [(0,0), (1,0), (2,0), (1,1)],
    T2 = [(0,1), (1,1), (2,1), (1,0)]

// 아래로 세칸
/// 오른쪽 두칸
let RZ2 = [(0,0), (0,1), (1,1), (1,2)],
    LZ2 = [(1,0), (1,1), (0,1), (0,2)],
    RL3 = [(1,0), (1,1), (1,2), (0,2)],
    RL4 = [(0,0), (0,1), (0,2), (1,0)],
    L3 = [(0,0), (0,1), (0,2), (1,2)],
    L4 = [(0,0), (1,0), (1,1), (1,2)],
    T3 = [(0,0), (0,1), (0,2), (1,1)],
    T4 = [(1,0), (1,1), (1,2), (0,1)]

// 아래로 네칸
/// 오른쪽 1칸
let S2 = [(0,0), (0,1), (0,2), (0,3)]

var answer = 0
for i in 0..<n {
    for j in 0..<m {
        
        if i <= n-1 {
            if j <= m-4 {
                var temp = 0
                for d in S1 {
                    temp += arr[i+d.1][j+d.0]
                }
                answer = max(answer, temp)
            }
        }
        
        if i <= n-2 {
            if j <= m-2 {
                for shape in [B1] {
                    var temp = 0
                    for d in shape {
                        temp += arr[i+d.1][j+d.0]
                    }
                    answer = max(answer, temp)
                }
            }
            
            if j <= m-3 {
                for shape in [RZ1, LZ1, RL1, RL2, L1, L2, T1, T2] {
                    var temp = 0
                    for d in shape {
                        temp += arr[i+d.1][j+d.0]
                    }
                    answer = max(answer, temp)
                }
            }
            
        }
        
        if i <= n-3 {
            if j <= m-2 {
                for shape in [RZ2, LZ2, RL3, RL4, L3, L4, T3, T4] {
                    var temp = 0
                    for d in shape {
                        temp += arr[i+d.1][j+d.0]
                    }
                    answer = max(answer, temp)
                }
            }
        }

        if i <= n-4 {
            if j <= m-1 {
                for shape in [S2] {
                    var temp = 0
                    for d in shape {
                        temp += arr[i+d.1][j+d.0]
                    }
                    answer = max(answer, temp)
                }
            }
        }
    }
}

print(answer)