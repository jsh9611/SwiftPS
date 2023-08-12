let T = Int(readLine()!)!

var total = 0
var receipt = [(min: Int, max: Int)]()

for _ in 0..<T {
    
    let n = Int(readLine()!)!
    var arr = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    
    var tempSum = arr[0]
    var maxIndex = 0
    var minIndex = 0
    
    var start = 0
    var finish = 0
    
    for idx in 1..<n {
        
        if arr[idx] < arr[idx-1] + arr[idx] {
            arr[idx] += arr[idx-1]
            finish = idx
        } else {
            start = idx
            finish = idx
        }
        
        if arr[idx] > tempSum {
            tempSum = arr[idx]
            maxIndex = finish
            minIndex = start
        } else if (arr[idx] == tempSum) && ((maxIndex - minIndex) > (finish - start)) {
            tempSum = arr[idx]
            maxIndex = finish
            minIndex = start
        }
    }
    
    total += tempSum
    receipt.append((minIndex + 1, maxIndex + 1))
}

print(total)
for item in receipt {
    print(item.min, item.max)
}