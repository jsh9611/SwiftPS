import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var distance: Int64 = 0
    var go = 0
    var back = 0
    
    for idx in (0..<n).reversed() {
        go += deliveries[idx]
        back += pickups[idx]
        
        if go > 0 {
            let tructs = go/cap + (go%cap > 0 ? 1 : 0)
            go -= tructs*cap
            back -= tructs*cap
            distance += Int64(tructs * (idx+1) * 2)
        }
        
        if back > 0 {
            let tructs = back/cap + (back%cap > 0 ? 1 : 0)
            go -= tructs*cap
            back -= tructs*cap
            distance += Int64(tructs * (idx+1) * 2)
        }
    }

    return distance
}