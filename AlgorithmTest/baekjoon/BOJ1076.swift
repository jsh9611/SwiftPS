import Foundation

var c1 = readLine()!
var c2 = readLine()!
var c3 = readLine()!

var ohm_v: [String: Int] = ["black": 0, "brown": 1, "red": 2, "orange": 3, "yellow": 4, "green": 5, "blue": 6, "violet": 7, "grey": 8, "white": 9]

var temp = Int(pow(10.0, Double(ohm_v[c3]!)))

print((10*ohm_v[c1]! + ohm_v[c2]!) * temp)
