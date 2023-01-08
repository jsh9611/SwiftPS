func solution(_ n:Int) -> Int {

    func nqueen(rightDown: Int, lookDown: Int, leftDown: Int) {
        // 퀸을 모두 놓을 수 있는 경우
        if lookDown == done {
            count += 1
            return
        }
        // 충돌 체크
        // 왼쪽 대각, 오른쪽 대각, 정면을 합해서 구한다.
        // 이후 연산을 위해 미리 보수를 취한다.
        var poss = ~(rightDown | lookDown | leftDown)

        // 비여있는 자리 있는지 체크
        // 놓을 수 있는 곳이 없을 때 까지 반복한다.
        while (poss & done) != 0 {
            
            // 빈자리의 위치를 구한다.
            let bit = poss & -poss
            
            // 퀸을 놓은 위치를 더해준다.
            poss -= bit
            
            // 왼쪽, 오른쪽 대각선은 비트와 논리합을 해준 뒤 한칸씩 시프트 한다.
            // 정면은 비트와 논리합만 해줘도 된다.
            nqueen(rightDown: (rightDown | bit)>>1, lookDown: (lookDown | bit), leftDown: (leftDown | bit)<<1)
        }
    }
    
    let done = 1<<n - 1
    var count = 0
    nqueen(rightDown: 0, lookDown: 0, leftDown: 0)
    return count
}

let n = Int(readLine()!)!
print(solution(n))