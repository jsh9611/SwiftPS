import Foundation

let percentage = [10, 20, 30, 40]
func generate(length: Int, result: [Int]) -> [[Int]] {
  if length == 0 {
    return [result]
  }

  var results = [[Int]]()
  for number in percentage {
    results += generate(length: length - 1, result: result + [number])
  }

  return results
}

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let cnt = emoticons.count
    let rates = generate(length: cnt, result: [])
    
    var maxPlus = 0
    var maxSales = 0
    
    for rate in rates {
        var plus = 0
        var sales = 0
        for user in users {
            var basket = 0
            for i in 0..<cnt {
                if user[0] <= rate[i] {
                    basket += emoticons[i]*(100-rate[i])/100
                }
            }

            if basket >= user[1] {
                plus += 1
            } else {
                sales += basket
            }
        }
        
        if plus > maxPlus {
            maxPlus = plus
            maxSales = sales
        }
        
        if plus == maxPlus {
            maxSales = max(maxSales, sales)
        }
    }
    
    return [maxPlus, maxSales]
}