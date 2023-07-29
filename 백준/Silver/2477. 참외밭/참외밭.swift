let n = Int(readLine()!)!
var arr = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 6)

var maxW = 0, W_idx = 0
var maxH = 0, H_idx = 0

for i in 0..<6 {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    let v = input[0]
    let e = input[1]
    
    arr[i][0] = v
    arr[i][1] = e
    
    if v == 1 || v == 2 {
        if maxW < e {
            maxW = e
            W_idx = i
        }
    } else {
        if maxH < e {
            maxH = e
            H_idx = i
        }
    }
}

let subH = abs(arr[(W_idx - 1 + 6)%6][1] - arr[(W_idx + 1 + 6)%6][1])
let subW = abs(arr[(H_idx - 1 + 6)%6][1] - arr[(H_idx + 1 + 6)%6][1])

let area = maxW*maxH - subW*subH
print(area * n)