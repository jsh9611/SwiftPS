import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let numbers = number.compactMap{ Int(String($0))}
    var cnt = k
    var answer: [Int] = []
    for num in numbers {
      if answer == [] {
        answer.append(num)
        continue
      }

      if cnt > 0 {
        while answer.last! < num {
          answer.removeLast()
          cnt -= 1
          if answer == [] || cnt <= 0 {
            break
          }
        }
      }
      answer.append(num)
      if answer.count == numbers.count - cnt {
          break
      }
    }
    return answer.map { "\($0)" }.joined()
}

print(solution("1924", 2)) // 94
print(solution("1231234", 3)) // 3234
print(solution("4177252841", 4)) // 775841
