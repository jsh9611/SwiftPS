let nm = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = nm[0], m = nm[1]
var house: [(Int,Int)] = []
var chicken: [(Int,Int)] = []
var survived: [(Int,Int)] = []
var isSelected = [Bool](repeating: false, count: 13)
var answer = Int.max

func calc() -> Int {
    var ans = 0
    for h in house {
        var temp = Int.max
        for s in survived {
            temp = min(temp, abs(h.0 - s.0) + abs(h.1 - s.1))
        }
        ans += temp
    }
    return ans
}

func dfs(_ row: Int, _ count: Int) {
    if survived.count == m {
        answer = min(answer, calc())
        return
    }
    for i in row..<chicken.count {
        if isSelected[i] { continue }
        isSelected[i] = true
        survived.append(chicken[i])
        dfs(i, count+1)
        let _ = survived.popLast()!
        isSelected[i] = false
    }
}

for i in 0..<n {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    for j in 0..<n {
        if input[j] == 1 {
            house.append((i,j))
        } else if input[j] == 2 {
            chicken.append((i,j))
        }
    }
}

dfs(0, 0)
print(answer)