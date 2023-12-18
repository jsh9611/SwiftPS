import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    let N = tickets.count
    let tickets = tickets.sorted{ $0[1] < $1[1] }
    
    var plans: [String:[String]] = [:]
    for ticket in tickets {
        let (start,end) = (ticket[0],ticket[1])
        
        if plans[start] == nil { plans[start] = [] }
        if plans[end] == nil { plans[end] = [] }
        
        plans[start]!.append(end)
    }
    
    var visited: [String:[String:Int]] = [:]
    for (start,ends) in plans {
        for end in ends {
            if visited[start] == nil {
                visited[start] = [end:1]
            } else {
                if visited[start]![end] == nil {
                    visited[start]![end] = 1
                } else {
                    visited[start]![end]! += 1
                }
            }
            
        }
    }
    
    func dfs(start: String, path: [String]) -> [String] {
        if path.count == N+1 {
            return path
        }
        
        if plans[start] != nil {
            for end in plans[start]! {
                if visited[start]![end] == 0 {
                    continue
                }
                
                visited[start]![end]! -= 1
                let result = dfs(start: end, path: path+[end])
                if !result.isEmpty { return result }
                visited[start]![end]! += 1
            }
        }
        return []
    }
    
    return dfs(start: "ICN", path: ["ICN"])
}