let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (n,score,p) = (info[0],info[1],info[2])

if n == 0 {
    print(1)
} else {
    var arr = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(score)
    arr.sort(by: >)

    let first = arr.firstIndex(of: score)! + 1
    let last = arr.lastIndex(of: score)! + 1

    if last > p {
        print(-1)
    } else {
        print(first)
    }
}