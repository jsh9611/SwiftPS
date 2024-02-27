import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n+1)
    
    for v in edge {
        graph[v[0]].append(v[1])
        graph[v[1]].append(v[0])
    }
    
    var queue = [Int]()
    var left = 0  // 가짜 큐 pop용
    var right = 0
    var distance = Array(repeating: -1, count: n+1)
    
    // 1 방문
    distance[1] = 0
    for next in graph[1] {
        distance[next] = 1
        queue.append(next)
        right += 1
    }
    
    // 방문이 가능한 경우
    while left < right {
        let now = queue[left]
        left += 1
        
        for next in graph[now] {
            if distance[next] == -1 {    // 아직 방문 안한 경우
                distance[next] = distance[now] + 1
                queue.append(next)
                right += 1
            }
        }
    }

    let maxValue = distance.max()!
    return distance.filter { $0 == maxValue }.count
}