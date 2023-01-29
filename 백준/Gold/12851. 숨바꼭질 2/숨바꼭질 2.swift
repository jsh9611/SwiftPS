let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }

let n = input[0]
let k = input[1]
var visited = false

if n == k {
    print(0)
    print(1)
} else {
    var queue: [(Int, Int)] = [(n, 0)]
    var time = [Int](repeating: 0, count: 100001)
    
    var index = 0
    var cnt = 0
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for next in [node.0 - 1, node.0 + 1, node.0 * 2] {
            if next == k {
                if !visited {
                    time[k] = time[node.0] + 1
                    cnt = 1
                    visited = true
                } else if time[k] == (node.1 + 1) {
                    cnt += 1
                }
                continue
            }
            
            if next < 0 || next > 100000 {
                continue
            }
            
            if time[next] == 0 || time[next] == node.1 + 1 {
                time[next] = node.1 + 1
                queue.append((next, node.1 + 1))
            } else {
                continue
            }
        }
    }
    print(time[k])
    print(cnt)
}