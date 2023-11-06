let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (r,c,t) = (info[0],info[1],info[2])

var dustMap = [[Int]]()
var purifier = -1
for i in 0..<r {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    dustMap.append(input)
    if purifier < 0 && input[0] == -1 {
        purifier = i
    }
}

func isOutOfRange(_ i: Int, _ j: Int) -> Bool {
    return i < 0 || j < 0 || i >= r || j >= c
}

func spread() {
    var tempMap = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
    for i in 0..<r {
        for j in 0..<c {
            let dust = dustMap[i][j]
            var leftDust = 0
            
            if dust < 0 {
                tempMap[i][j] = 0
                continue
            }
            
            for (di,dj) in [(-1,0), (1,0), (0,-1), (0,1)] {
                let (ni,nj) = (i+di, j+dj)
                
                if !isOutOfRange(ni, nj) {
                    if (ni,nj) != (purifier,0) && (ni,nj) != (purifier+1,0) {
                        tempMap[ni][nj] += dust/5
                        leftDust += dust/5
                    }
                }
            }
            tempMap[i][j] += (dust - leftDust)
        }
    }
    dustMap = tempMap
}

func upwardWind() {
    // 반시계 방향
    let directions = [(0, 1), (-1, 0), (0, -1), (1, 0)]
    var num = 0
    var (i,j) = (purifier, 1)
    var priv = 0
    while true {
        let (ni,nj) = (i + directions[num].0, j + directions[num].1)
        if i == purifier && j == 0 {
            break
        }
        
        if isOutOfRange(ni, nj) {
            num += 1
            continue
        }
        
        (dustMap[i][j], priv) = (priv, dustMap[i][j])
        (i,j) = (ni,nj)
    }
}

func downwardWind() {
    // 시계 방향
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var num = 0
    var (i,j) = (purifier+1, 1)
    var priv = 0
    while true {
        let (ni,nj) = (i + directions[num].0, j + directions[num].1)
        if i == purifier+1 && j == 0 {
            break
        }
        
        if isOutOfRange(ni, nj) {
            num += 1
            continue
        }
        
        (dustMap[i][j], priv) = (priv, dustMap[i][j])
        (i,j) = (ni,nj)
    }
}

for _ in 0..<t {
    spread()
    upwardWind()
    downwardWind()
}

var answer = 0
for item in dustMap {
    answer += item.reduce(0, +)
}

print(answer)