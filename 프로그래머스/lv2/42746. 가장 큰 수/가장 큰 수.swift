import Foundation

func solution(_ numbers:[Int]) -> String {
    let number = numbers.map{ String($0) }.sorted{ $0+$1 > $1+$0 }.joined(separator: "")
    return (number.first! == "0") ? "0" : number
}