import Foundation

func isOneCharacterDifferent(_ s1: String, _ s2: String) -> Bool {
    var diffCount = 0
    let s1 = Array(s1)
    let s2 = Array(s2)

    for i in 0..<s1.count {
        if s1[i] != s2[i] {
            diffCount += 1
        }
    }
    
    return diffCount == 1
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = [Bool](repeating: false, count: words.count)
    
    func dfs(_ now: String, _ cnt: Int, _ answer: Int) -> Int {
        var answer = answer
        if now == target {
            return cnt
        }
        
        for i in 0..<words.count {
            if !visited[i] && isOneCharacterDifferent(now, words[i]) {
                visited[i] = true
                answer = min(answer, dfs(words[i], cnt+1, answer))
                visited[i] = false
            }
        }
        
        return answer
    }
    
    let ans = dfs(begin, 0, Int.max)
    return ans == Int.max ? 0 : ans
}
