import Foundation

func solution(_ name:String) -> Int {
    // 알파벳을 아스키 형태로 변환
    let nameValue = name.compactMap{ $0.asciiValue }
    let ascii_A = Character("A").asciiValue!
    let ascii_Z = Character("Z").asciiValue!
    
    // 알파벳을 변경하는 최소 조작 횟수 반환
    func minMoveCharCount(_ target: UInt8) -> Int {
        return Int(min((target - ascii_A), (ascii_Z - target + 1)))
    }

    let nameSize = nameValue.count    
    var move = nameSize - 1     // 좌우 이동 횟수
    var answer = 0              // 알파벳 변경 횟수
    
    // 먼저, "A"가 연속하는 가장 긴 구역의 left와 right 인덱스를 구한다.
    // 이후, 처음부터 left까지, right부터 끝까지의 길이를 이용해 최소 움직임을 계산한다.
    for left in 0..<nameSize {
        answer += minMoveCharCount(nameValue[left])
        
        var index = left + 1
        while(index < nameSize) {
            if nameValue[index] == ascii_A { index += 1 }
            else { break }
        }
        
        let right = nameSize - index
        move = min(move, left+right+min(left, right))
    }

    
    return answer + move
}