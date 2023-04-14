import Foundation

func solution(_ citations:[Int]) -> Int {
    var citations = citations.sorted()
    let cnt = citations.count
    for h in stride(from: cnt, to: 0, by: -1) {
          if citations[cnt - h] >= h { return h }
    }
    return 0
}