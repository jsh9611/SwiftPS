import Foundation

func solution(_ s:String) -> Int {
    let arr = Array(s)
    let length = arr.count
    
    var answer = 0
    
    if length == 1 { return 1 }
    
    for idx in 1..<length-1 {
        var alpha = 0
        while true {
            alpha += 1
            if idx+alpha > length-1 || idx-alpha < 0 {
                alpha -= 1
                break
            }
            
            if arr[idx+alpha] != arr[idx-alpha] {
                alpha -= 1
                break
            }
        }
        answer = max(answer, 1+2*alpha)
    }
    
    for idx in 1..<length {
        var alpha = 0
        while true {
            
            if idx+alpha >= length || idx-1-alpha < 0 {
                alpha -= 1
                break
            }
            
            if arr[idx+alpha] != arr[idx-1-alpha] {
                alpha -= 1
                break
            }
            
            alpha += 1
        }
        answer = max(answer, 2+alpha*2)
    }
    
    return answer == 0 ? 1 : answer
}