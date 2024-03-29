struct MinHeap<T: Comparable> {
    var heap: [T] = []
    
    var isEmpty: Bool {
        return heap.count <= 1 ? true : false
    }
    
    init() {}
    init(_ element: T) {
        heap.append(element) // 0번 index채우기 용
        heap.append(element) // 실제 Root Node 채움.
    }
    
    mutating func insert(_ element: T) {
        if heap.isEmpty {
            heap.append(element)
            heap.append(element)
            return
        }
        heap.append(element)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 { // Root Node일 때,
                return false
            }
            let parentIndex = insertIndex / 2
            return heap[insertIndex] < heap[parentIndex] ? true : false
        }
        
        var insertIndex = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus { case left, right, none }
    
    mutating func pop() -> T? {
        if heap.count <= 1 {
            return nil
        }
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = poppedIndex * 2
            let rightChildIndex = leftChildIndex + 1
            
            // 자식이 없는 경우 자기자신 제거
            if leftChildIndex >= heap.count {
                return .none
            }
            
            // 왼쪽 자식만 있다면 부모와 자식 노드 중 작은 수를 제거
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] < heap[poppedIndex] ? .left : .none
            }
            
            // 왼쪽, 오른쪽 자식 모두가 자신보다 큰 경우 부모 노드를 제거
            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightChildIndex] > heap[poppedIndex]) {
                return .none
            }
            
            // 왼쪽, 오른쪽 자식 최소 하나 이상 부모보다 작은 경우, 가장 작은 노드를 제거한다.
            if (heap[leftChildIndex] < heap[poppedIndex]) || (heap[rightChildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            return .none
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
}

var deck: MinHeap<Int> = MinHeap()
var answer = 0

for _ in 0..<Int(readLine()!)! {
    deck.insert(Int(readLine()!)!)
}

while !deck.isEmpty {
    let a = deck.pop()!
    if deck.isEmpty { break }
    let b = deck.pop()!
    answer += a + b
    deck.insert(a + b)
}

print(answer)
