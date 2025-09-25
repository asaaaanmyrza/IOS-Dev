//Task 7

func calculateAverage(_ studentList: [String:Double]) -> Double {
    var sum = 0.0
    for (_, value) in studentList {
        sum += value
    }
    return sum / Double(studentList.count)
}

func calculateMinimum(_ studentList: [String:Double], avg: Double) -> Double {
    var minimum = avg
    
    for (_,value) in studentList {
        if (minimum > value) {
            minimum = value
        }
    }
    
    return minimum
}

func calculateMaximum(_ studentList: [String:Double], avg: Double) -> Double {
    var maximum = avg
    
    for (_,value) in studentList {
        if (maximum < value) {
            maximum = value
        }
    }
    
    return maximum
}

func printResult(average: Double, of studentList: [String:Double] ) -> [String:String] {
    var result: [String:String] = [:]
    for (name, value) in studentList {
        if (value > average) {
            result[name] = "above Average"
        }
        else {
            result[name] = "below Average"
        }
    }
    
    return result
}

var studentList: [String: Double] = ["John Fruischiante": 4.5, "Arsen": 1.0, "Asan": 10.6]

var average = calculateAverage(studentList)

var minimum = calculateMinimum(studentList, avg: average)

var maximum = calculateMaximum(studentList, avg: average)

printResult(average: average, of: studentList)


