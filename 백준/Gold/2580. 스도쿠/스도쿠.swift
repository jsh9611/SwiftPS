import Foundation

var rows = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9)
var cols = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9)
var cells = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9)

var sudoku: [[Int]] = []
for i in 0..<9 {
    let input = (readLine()!.split{ $0 == " " }.map{ Int($0)! })
    sudoku.append(input)
    for j in 0..<9 {
        let num = sudoku[i][j]
        if num != 0 {
            rows[i][num] = true
            cols[j][num] =  true
            cells[i/3*3 + j/3][num] = true
        }
    }
}

func dfs(_ cnt: Int) {
    if cnt == 81 {
        for line in sudoku {
            for item in line {
                print(item, terminator: " ")
            }
            print()
        }
        exit(0)
    }
    
    let row = cnt/9
    let col = cnt%9
    
    if sudoku[row][col] == 0 {
        for number in 1...9 {
            if !rows[row][number], !cols[col][number], !cells[row/3*3 + col/3][number] {
                rows[row][number] = true
                cols[col][number] = true
                cells[row/3*3 + col/3][number] = true
                sudoku[row][col] = number
                dfs(cnt + 1)
                rows[row][number] = false
                cols[col][number] = false
                cells[row/3*3 + col/3][number] = false
                sudoku[row][col] = 0
            }
        }
    } else {
        dfs(cnt + 1)
    }
}
dfs(0)