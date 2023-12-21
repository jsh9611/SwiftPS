import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var grid: [Int:[Int]] = [:]
    var answer = n
    
    for i in 1...n {
        grid[i] = []
    }
    
    for wire in wires {
        let (v1,v2) = (wire[0],wire[1])
        
        grid[v1]!.append(v2)
        grid[v2]!.append(v1)
    }
    
    var visited = Set<Int>()
    
    func countChild(_ parent: Int) -> Int {
        visited.insert(parent)
        
        var cnt = 1
        
        for child in grid[parent]! {
            if visited.contains(child) { continue }
            cnt += countChild(child)
        }
        
        answer = min(answer, abs( cnt - (n - cnt) ))
        
        return cnt
    }
    
    _ = countChild(wires[0][0])
    
    return answer
}