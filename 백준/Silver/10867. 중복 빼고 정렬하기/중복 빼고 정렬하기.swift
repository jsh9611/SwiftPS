let _ = readLine()
print(Set(readLine()!.split{$0 == " "}.map{Int($0)!}).sorted().map{String($0)}.joined(separator: " "))