import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportInfo:[String:Set<String>] = [:]
    var reportCount:[Int] = Array(repeating: 0, count: id_list.count)
    var idNumber:[String:Int] = [:]
    
    for (idx,id) in id_list.enumerated() {
        idNumber[id] = idx
    }
    
    for rpt in report {
        let split = rpt.split(separator: " ")
        let reporter = String(split[0])
        let reported = String(split[1])
        
        if reportInfo[reported] == nil {
            reportInfo[reported] = [reporter]
        } else {
            reportInfo[reported]!.insert(reporter)
        }
    }
    
    for info in reportInfo {
        if info.value.count >= k {
            for badGuy in info.value {
                reportCount[idNumber[badGuy]!] += 1
            }
        }
    }
    return reportCount
}