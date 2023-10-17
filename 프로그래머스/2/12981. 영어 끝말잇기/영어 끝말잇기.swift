import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var turn = 0
    var wordSet = Set<String>()
    var now = words[0].first!
    
    for i in 0..<words.count {

        if wordSet.contains(words[i]) { break }
        if now != words[i].first! { break }
        
        turn += 1
        now = words[i].last!
        wordSet.insert(words[i])
    }
    return words.count == wordSet.count ? [0,0] : [turn%n + 1, turn/n + 1]
}