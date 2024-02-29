import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    
    var graph: [Int:(input: Int, output: Int)] = [:]
    
    for edge in edges {
        let s = edge[0]
        let e = edge[1]
        
        if graph[s] == nil {
            graph[s] = (0, 0)
        }
        
        if graph[e] == nil {
            graph[e] = (0, 0)
        }
        
        graph[s]?.output += 1
        graph[e]?.input += 1
    }
    
    var bar = 0, eight = 0, donut = 0
    var start = 0
    
    for (vertex, info) in graph {
        if info.output == 0 {
            bar += 1
            
        } else if info.output == 1 {
            continue
            
        } else if info.output == 2 {
            if info.input == 0 {
                start = vertex
            } else {
                eight += 1
            }
            
        } else if info.output > 2 {
            start = vertex
        }
    }
    
    donut = graph[start]!.output - bar - eight
    
    return [start, donut, bar, eight]
}