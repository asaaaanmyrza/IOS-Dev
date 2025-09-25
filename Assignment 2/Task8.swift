//Task 8

var word: String

func isPalindrome(word: String) -> Bool {
    var checkWord = word.lowercased().filter { ("a"..."z").contains($0) }
    let reversedWord = String(checkWord.reversed())
    return checkWord == reversedWord
}

word = "Never odd or even"
print(isPalindrome(word: word))
