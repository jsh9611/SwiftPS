let n = Int(readLine()!)!
let ab = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let start = ab[0]
let end = ab[1]
let m = Int(readLine()!)!

var arr: [Int:[Int]] = [:]

for _ in 0..<m {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    if let temp = arr[input[0]] {
        arr[input[0]] = temp + [input[1]]
    } else {
        arr[input[0]] = [input[1]]
    }
    
    if let temp2 = arr[input[1]] {
        arr[input[1]] = temp2 + [input[0]]
    } else {
        arr[input[1]] = [input[0]]
    }
}

var visited = [Bool](repeating: false, count: n+1)
var answer = 0

func dfs(_ now: Int, _ answer: Int, _ cnt: Int) -> Int {
    var answer = answer
    if now == end {
        return cnt
    }
    
    if let next = arr[now] {
        for node in next {
            if !visited[node] {
                visited[node] = true
                answer = min(answer, dfs(node, answer, cnt+1))
                visited[node] = false
            }
        }
    }
    return answer
}

let ans = dfs(start, Int.max, 0)
print(ans == Int.max ? -1 : ans)