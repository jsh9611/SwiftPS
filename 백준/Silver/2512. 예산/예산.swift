let n = Int(readLine()!)!
var money = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let target = Int(readLine()!)!

var left = 0
var right = money.max()!

while left <= right {
    let mid = (left+right)/2
    var nowMoney = 0
    for m in money {
        nowMoney += (m < mid) ? m : mid
    }
    if nowMoney > target {
        right = mid - 1
    } else {
        left = mid + 1
    }
}
print(left - 1)