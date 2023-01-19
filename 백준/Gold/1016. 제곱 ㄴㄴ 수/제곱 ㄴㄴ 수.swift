func solution() {
    let input = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    let mini = input[0]
    let maxi = input[1]
    // 구해야 하는 숫자는 모두 비교할 필요 없이 최소값과 최대값 사이에 대해서만 확인하면 된다.
    var ans = maxi - mini + 1
    var visited = [Bool](repeating: false, count: ans)
    
    // 처음 제곱수는 2*2 = 4 에서 시작
    var i = 2
    
    // 제곱수가 최대값보다 같거나 작은 경우에만 진행
    while i*i <= maxi {
        
        // 최소값을 나누어떨어지게 하는 제곱수를 찾기
        var temp = mini / (i*i)
        
        // 제곱수로 나누었을 때 나머지가 존재하는 경우 그 다음수부터 체크
        if mini % (i*i) != 0 {
            temp += 1
        }
        
        // maxi까지 temp를 1씩 증가시키면서 제곱수로 나누어지는 수를 제거
        while temp*i*i <= maxi {
            
            // 제곱수로 나눌 수 있는 숫자에 방문하지 않은 경우
            if !visited[temp*i*i - mini] {

                // 방문처리를 한 뒤에 결과값에서 1 차감
                visited[temp*i*i - mini] = true
                ans -= 1
            }
            
            temp += 1
        }
        
        i += 1
    }
    print(ans)
}

solution()