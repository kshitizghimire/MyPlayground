
let array = ["so", "ad", "1a"]

let sorted = array.sorted {$0 < $1}
print(sorted)
print(array)// original array doesn't change


var array2 = ["so", "ad", "1a"]
array2.sort {$0 < $1}
print(array2) // orignal array changees
