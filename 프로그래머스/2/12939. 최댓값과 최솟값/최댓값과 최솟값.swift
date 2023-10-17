func solution(_ s:String) -> String {
    let num = s.split{ $0 == " " }.map{ Int($0)! }.sorted()
    return "\(num.min()!) \(num.max()!)"
}