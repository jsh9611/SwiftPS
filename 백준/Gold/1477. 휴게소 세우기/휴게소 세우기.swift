let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N,M,L) = (input[0],input[1],input[2])

var places = readLine()!.split(separator: " ").map{ Int($0)! }
places.append(0)
places.append(L)

let own = places.count
places.sort()

var left = 1
var right = L-1
var mid = (left+right) / 2

while left<=right {
    var count = 0
    mid = (left+right)/2
    
    for i in 0..<own-1 {
        let distance = places[i+1] - places[i]
        count += distance/mid
        
        if distance%mid == 0 {
            count -= 1
        }
    }
    
    if count > M {
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(left)