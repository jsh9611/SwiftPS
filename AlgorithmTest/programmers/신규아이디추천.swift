import Foundation

func solution(_ new_id:String) -> String {
    var str = new_id
    if str == "" {
        return "aaa"
    }
    str = new_id.lowercased()
    while true {
        var ans = ""
        for i in 0..<str.count {
            var temp = str[str.index(str.startIndex, offsetBy: i)]
            if (temp >= "a" && temp <= "z") || (temp >= "0" && temp <= "9") || temp == "-" || temp == "_" || temp == "."{
                if ans.count == 0 && temp == "." {
                    continue
                } else if temp == "." && ans[ans.index(ans.endIndex, offsetBy: -1)] == "." {
                    continue
                }
                ans.append(temp)

                if ans.count >= 15 {
                    if ans[ans.index(ans.endIndex, offsetBy: -1)] != "." {

                        return ans
                    }
                    else {
                        break
                    }
                }
                
            }

        }

        while ans.count < 3 {
            if ans == "" {
                return "aaa"
            }
            if ans[ans.index(ans.endIndex, offsetBy: -1)] == "." {

                ans.popLast()
                continue
            }
            ans.append(ans[ans.index(ans.endIndex, offsetBy: -1)])
        }
        
        if ans[ans.index(ans.endIndex, offsetBy: -1)] == "." {
            ans.popLast()
            str = ans
            continue
        } else {
            return ans
        }
    }
}

"""
출처: 프로그래머스
https://programmers.co.kr/learn/courses/30/lessons/72410

풀이:
문제에서 요구하는 7단계를 순차적으로 구현하였다.
swift 문법이 익숙하지 않아 문자열 처리에서 시간이 오래걸렸다.

  newID = newID.replacingOccurrences(of: "..", with: ".")
  newID = newID + String(newID.last!)
  while newID.hasPrefix(".") { newID.removeFirst() }
  while newID.hasSuffix(".") { newID.removeLast() }
  newID = String(newID[newID.startIndex..<newID.index(newID.startIndex, offsetBy: 15])

다른 사람의 풀이를 통해 replacingOccurrences, hasPrefix, hasSuffix, removeFirest(), removeLast()를 알게되었다.
또한 offsetBy를 활용하여 일종의 슬라이싱을 할 수 있다는 점을 배웠다.
"""
