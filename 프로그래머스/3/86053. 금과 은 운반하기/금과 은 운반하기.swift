import Foundation

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {    
    var L = 1
    var R = 2*100000*2*1000000000
    let n = g.count

    while L+1 < R {
        var total_capacity = 0
        var gold_capacity = 0
        var silver_capacity = 0
        let time = (L+R)/2
        
        for i in 0..<n {
            let arrivals = (time / (2 * t[i])) + ((time%(2*t[i]) >= t[i]) ? 1 : 0)
            let capacity = min(arrivals*w[i], g[i]+s[i])

            total_capacity += capacity
            gold_capacity += min(capacity, g[i])
            silver_capacity += min(capacity, s[i])
            
        }
        
        if (total_capacity >= a+b) && (gold_capacity >= a) && (silver_capacity >= b) {
            R = time
        } else {
            L = time
        }
    }
    
    return Int64(R)
}