import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var (w,h) = (0,0)
    for size in sizes.sorted(by: { $0.max()! > $1.max()! }) {
        w = max( w, size.max()! )
        h = max( h, size.min()! )
    }
    
    return w*h
}