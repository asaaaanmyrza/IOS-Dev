//Task 2
func isPrime(_ number: Int) -> Bool {
    if number == 1 {
        return true
    }
    var isPrime = true
    for i in 2..<number {
        if number % i == 0 {
            isPrime = false
            break
        }
    }
    return isPrime
}

for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}
