//Task 4

func addItem(_ item: String, to shoppingList: inout [String]) {
    shoppingList.append(item)
}

func removeItem(_ item: String, from shoppingList: inout [String]) {
    for (index, value) in shoppingList.enumerated() {
        if value == item {
            shoppingList.remove(at: index)
            break
        }
    }
}

func displayList(_ shoppingList: [String]) {
    print("\(shoppingList.count) items in list:")
    for (index, value) in shoppingList.enumerated() {
        print("\(index + 1). \(shoppingList[index])")
    }
    print("")
}

var shoppingList: [String] = []

addItem("Apples", to: &shoppingList)
addItem("Apples", to: &shoppingList)


removeItem("Apples", from: &shoppingList)

addItem("Milk", to: &shoppingList)
addItem("Eggs", to: &shoppingList)

displayList(shoppingList)

removeItem("Eggs", from: &shoppingList)

displayList(shoppingList)

