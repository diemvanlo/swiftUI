import Cocoa


// shkqbyutdvknyrpjof
// cuieokbs
// yzubfsiypfrepcfftiov
let s = "yzubfsiypfrepcfftiov"

func partitionString(_ s: String) -> Int {
    var res = 0
    var buff = Set<Character>()
    
    for c in s {
        if buff.contains(c) {
            res += 1
            buff.removeAll()
        }
        buff.insert(c)
    }
    
    return res + 1
}
