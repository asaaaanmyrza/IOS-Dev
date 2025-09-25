//Task 10

func hasUniqueCharacters(in text: String) -> Bool {
    var textSorted = Array(text).sorted()
    for index in 1...textSorted.count-1 {
        if textSorted[index] == textSorted[index - 1] {
            return false
        }
    }
    return true
}

var test1 = "Hello World!"
print(hasUniqueCharacters(in: test1))

var test2 = "abcdefghijklmnopqrstuvwxyz"
print(hasUniqueCharacters(in: test2)) 
