//Task 6

func fibonacci (n: Int) -> [Int] {
    var result: [Int] = []
    if n <= 0 {
        return result
    }
    for i in 0..<n {
        if i < 2 {
            result.append(i)
        }
        else {
            result.append(result[i-2] + result[i-1])
        }
    }
    
    return result
}

fibonacci(n:1)
