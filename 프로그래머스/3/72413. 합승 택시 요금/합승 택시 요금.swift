import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](repeating: 100001*n, count: n+1), count: n+1)
    var answer = 100001*n
    
    for f in fares {
        graph[f[0]][f[1]] = f[2]
        graph[f[1]][f[0]] = f[2]
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if (graph[i][k] + graph[k][j]) < graph[i][j] {
                    graph[i][j] = graph[i][k] + graph[k][j]
                }
            }
        }
    }
    
    for i in 1...n {
        graph[i][i] = 0
    }
    
    for stopover in 1...n {
        answer = min(answer, graph[s][stopover] + graph[stopover][a] + graph[stopover][b])
    }
    
    return answer
}