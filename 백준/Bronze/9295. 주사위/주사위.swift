for i in 1...Int(readLine()!)! {
    let input = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
    print("Case \(i): \(input[0] + input[1])")
}