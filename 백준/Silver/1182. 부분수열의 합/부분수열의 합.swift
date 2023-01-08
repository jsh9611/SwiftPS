let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }

let n = input[0]
let s = input[1]

var visited = Array(repeating: false, count: 21)
var count = 0

dfs(0, 0, true)

func dfs(_ num: Int, _ sum: Int, _ isFirst: Bool) {

    if !isFirst, sum == s {
        count += 1
    }

    for i in num..<n {
        if !visited[i] {
            visited[i] = true
            dfs(i+1, sum+arr[i], false)
            visited[i] = false
        }
    }
}

print(count)