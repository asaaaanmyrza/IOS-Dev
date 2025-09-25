//Task 9

var first: Double
var second: Double

func addition(_ first: Double, _ second: Double) -> Double {
    return first + second
}

func subtraction(_ first: Double, _ second: Double) -> Double {
    return first - second
}
func multiplication(_ first: Double, _ second: Double) -> Double {
    return first * second
}
func division(_ first: Double, _ second: Double) -> Double {
    return first / second
}

first = 5.0
second = 2.0

print("Addition: \(addition(first, second))")
print("Subtraction: \(subtraction(first, second))")
print("Multiplication: \(multiplication(first, second))")
print("Division: \(division(first, second))")
