import Foundation

let n = Int(readLine()!)!
if n == 1{
    print("*")
    exit(0)
}
for i in 0...n-1{
    for j in (0...n-i-1){
        if j == 0{
            continue
        }
        print(" ", terminator: "")
    }
    for _ in 0...(2*i){
        print("*", terminator: "")
    }
    print()
}

for i in (1...n-1).reversed(){
    for _ in (1...n-i){
        print(" ", terminator: "")
    }
    for _ in 0...(2*i-2){
        print("*", terminator: "")
    }
    print()
}
