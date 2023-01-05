while true {
    let arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    var visited = [Bool](repeating: false, count: arr[0]+1)
    if arr[0] == 0 {
        break
    }
    
    dfs(data: arr, curIdx: 1, curCnt: 0, answer: "", visited: &visited)
    print()
}

func dfs(data: [Int], curIdx: Int, curCnt: Int, answer: String, visited: inout [Bool]) {
    if curCnt == 6 {
        print(answer)
    }
    
    for i in curIdx..<data.count {
        if !visited[i] {
            visited[i] = true
            dfs(data: data, curIdx: i, curCnt: curCnt+1, answer: answer + "\(data[i]) ", visited: &visited)
            visited[i] = false
        }
    }
}