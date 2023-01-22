let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }

let n = input[0]
let k = input[1]

var result = 0

if n == k {
    print(result)
} else {
    var queue: [(Int, Int)] = [(n, 0)]
    var visited = [Bool](repeating: false, count: 100001)

    var index = 0
    visited[n] = true
    
    while index < queue.count{
        let node = queue[index]
        index += 1

        for next in [node.0 - 1, node.0 + 1, node.0 * 2] {
            if next == k {
                result = node.1 + 1
                index = queue.count
                break
            }
            
            if next < 0 || next > 100000 || visited[next] {
                continue
            }
            
            visited[next] = true
            queue.append((next, node.1 + 1))
        }
    }
    print(result)
}