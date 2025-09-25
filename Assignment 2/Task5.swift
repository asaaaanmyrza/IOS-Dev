//Task 5

func countUniqueWords (in text: String) -> [String: Int] {
    let textClean = text.lowercased()
    let words = textClean.split(separator: " ").map { String($0) }
    var result: [String: Int] = [:]
    
    for word in words {
        result[word, default: 0] += 1
    }
    
    return result
}

let text = "Hello World Hello World. Hello World."
print(countUniqueWords(in: text))

