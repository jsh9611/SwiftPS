// 최소힙
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
    
    func count() -> Int {
        return heap.count
    }
    
    func peak() -> T? {
        if self.isEmpty { return nil }
        return heap[1]
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

extension Array {
    // [T1,T2] 형태의 배열을 (T1,T2)로 반환
    func tuple() -> (Element,Element) {
        return (self[0],self[1])
    }
}

// 입력
let nk = readLine()!.split{ $0 == " " }.map{ Int($0)! }
let n = nk[0]
let k = nk[1]

var jewelry: [(weight: Int, value: Int)] = []
var bags: [Int] = []

for _ in 0..<n {
    jewelry.append(readLine()!.split{ $0 == " " }.map{ Int($0)! }.tuple())
}

for _ in 0..<k {
    bags.append(Int(readLine()!)!)
}

// 무게가 작은 순으로, 같은 무게라면 가치가 작은 순서가 가장 뒤로 가도록 정렬
jewelry.sort{ ($0.0,$0.1) > ($1.0,$1.1) }

// 무게가 작은 가방이 앞으로 가도록 정렬
bags.sort()

// 최대힙을 사용해야하기 때문에 원소를 넣거나 빼기 전에 음수를 취해준다.
var answer = 0
var wishList = MinHeap<Int>()

// 가방 무게가 작은 순서대로 보석을 넣는다
for bag in bags {
    
    // 보석이 가방에 들어갈 수 있는 무게가 된다면 모두 wishList에 집어넣는다.
    while !jewelry.isEmpty, bag >= jewelry.last!.weight {
        wishList.insert(-jewelry.popLast()!.value)
    }
    
    if !wishList.isEmpty {
        // 가치가 가장 큰 보석 한개를 가방에 넣는다
        answer += -wishList.pop()!
        
    } else if jewelry.isEmpty {
        // 더이상 보석이 없기 때문에 종료
        break
    }
}

// 정답 출력
print(answer)