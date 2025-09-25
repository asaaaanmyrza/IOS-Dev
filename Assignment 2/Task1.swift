//Task 1

for number in 1...100 {
    var result = ""
    if number % 3 == 0 {
        result += "Fizz"
    }
    if number % 5 == 0 {
        result += "Buzz"
    }
    if result.isEmpty {
        result = "\(number)"
    }
    print(result)
}
