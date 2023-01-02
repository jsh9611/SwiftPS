let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }

var enQueue: [Int] = [Int](1...input[0])
var deQueue: [Int] = []

var isQueueEmpty: Bool {
    return enQueue.isEmpty && deQueue.isEmpty
}

func pop() -> Int {
    if deQueue.isEmpty {
        deQueue = enQueue.reversed()
        enQueue.removeAll()
    }
    return deQueue.popLast() ?? -1
}

func push(_ element: Int) {
    enQueue.append(element)
}

var k = input[1]
var answer: [String] = []
while !isQueueEmpty {
    k -= 1
    if k == 0 {
        answer.append(String(pop()))
        k = input[1]
    } else {
        push(pop())
    }
}

print("<\(answer.joined(separator: ", "))>")