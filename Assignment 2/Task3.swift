//Task 3

enum Format {
    case Celsius, Fahrenheit, Kelvin
}

func convertTemp(_ from: Format, _ to: Format, value: Double) -> Double {
    if from == .Kelvin && to == .Fahrenheit {
        return -459.67 + 1.8 * value
    }
    else if from == .Fahrenheit && to == .Kelvin {
        return 255.37 + value / 1.8
    }
    else if from == .Kelvin && to == .Celsius {
        return value - 273.15
    }
    else if from == .Celsius && to == .Kelvin {
        return value + 273.15
    }
    else if from == .Celsius && to == .Fahrenheit {
        return 32 + 1.8 * value
    }
    else if from == .Fahrenheit && to == .Celsius {
        return value / 1.8 - 17.78
    }
    return value
}

//C to F = 32 + 1.8n
//C to K = 273.15 + n
//K to F = -459.67 + 1.8n
//F to K = 255.37 + n/1.8
//F to C = n/1.8 - 17.78
//K to C = n - 273.15

print (convertTemp(.Celsius, .Fahrenheit, value: 100))
print (convertTemp(.Fahrenheit, .Kelvin, value: 1000))
print (convertTemp(.Kelvin, .Celsius, value: 1000))
