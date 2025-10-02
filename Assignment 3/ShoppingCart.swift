import Foundation

enum Category {
    case tent, boots, flashlight, gps, backpack, raincover
}

struct Product {
    let id: String
    let name: String
    var price: Double
    let category: Category
    var description: String
    var currentPrice: String {
        return "$ \(price)"
    }
    
    init(id: String, name: String, price: Double, category: Category, description: String) {
        self.id = id
        self.name = name
        self.price = max(0, price)
        self.category = category
        self.description = description
    }
}

struct CartItem {
    let product: Product
    var quantity: Int
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        quantity = newQuantity
    }
    
    mutating func increaseQuantity(byAmount amount: Int = 1) {
        quantity += amount
    }
    
    init (product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = quantity
    }
}

class ShoppingCart {
    var items: [CartItem]
    var discountCode: String?
    
    init(items: [CartItem] = [], discountCode: String? = nil) {
        self.discountCode = discountCode
        self.items = items
    }
    
    func addItem(product: Product, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increaseQuantity(byAmount: quantity)
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            items.append(newItem)
        }
    }
    
    func removeItem(productId: String) {
        if let index = items.firstIndex(where: { $0.product.id == productId}) {
            items.remove(at:index)
        }
    }
    
    func updateItemQuantity(productId: String, newQuantity: Int) {
        if let index = items.firstIndex(where: { $0.product.id == productId}) {
            if newQuantity == 0 {
                items.remove(at:index)
            } else {
                items[index].updateQuantity(newQuantity)
            }
        }
    }
    
    func clearCart () {
        items.removeAll()
    }
    
    var subtotal: Double {
        return items.reduce(0) { $0 + $1.subtotal }
    }
    
    var discountAmount: Double {
        if discountCode == nil { return 0 }
        let discountValue = Double(discountCode!.filter { $0.isNumber })
        return subtotal * Double(discountValue ?? 0) / 100
    }
    
    var total: Double {
        return subtotal - discountAmount
    }
    
    var itemCount: Int {
        var count = 0
        for item in items {
            count += item.quantity
        }
        return count
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
}

struct Address {
    var street: String
    var city: String
    var zipCode: String
    var country: String
    var formattedAddress: String {
        return "\(street), \(city), \(zipCode), \(country)"
    }
    
}

struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    var itemCount: Int {
        return items.count
    }
    
    init(from cart: ShoppingCart, shippingAddress: Address){
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
}

print("Test 1:")
//1

let tentTeslin = Product(id: "1", name: "Tent Teslin", price: 300, category: .tent, description: "4-person tent")
let salomonBoots = Product(id: "2", name: "Salomon Boots", price: 200, category: .boots, description: "midseason boots")
let ospreyBackpack = Product(id: "3", name: "Osprey Light", price: 150, category: .backpack, description: "light 30l backpack")
let nitecoreLight = Product(id: "4", name: "Nitecore H100", price: 20, category: .flashlight, description: "flashlight ligher than chicken egg")

print("Products created!")

print("Test 2:")
//2

let cart = ShoppingCart()
cart.addItem(product: tentTeslin, quantity: 1)
cart.addItem(product: ospreyBackpack, quantity: 1)
print("Quantity: \(cart.items[1].quantity)")

print("Test 3:")
//3

cart.addItem(product: ospreyBackpack, quantity: 1)
print("Quantity: \(cart.items[1].quantity)")

print("Test 4:")
//4

print("Subtotal: \(cart.subtotal)")
print("Item count: \(cart.itemCount)")

print("Test 5:")
//5

cart.discountCode = "SAVE10"
print("Total with discount: \(cart.total)")

print("Test 6:")
//6

cart.removeItem(productId: "3")
print("Item count: \(cart.itemCount)")

print("Test 7:")
//7

func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: nitecoreLight, quantity: 1)
}
modifyCart(cart)
print("Item count: \(cart.itemCount)")

print("Test 8:")
//8

let item1 = CartItem(product: salomonBoots, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
print("Quantity: \(item1.quantity)")

print("Test 9:")
//9

let address = Address(street: "Gogol", city: "Almaty", zipCode: "dunno", country: "Kazakhstan")
let order = Order(from: cart, shippingAddress: address)

print("Order created!")

print("Test 10:")
//10

cart.clearCart()
print("Cart item count: \(cart.itemCount)")
print("Order item count: \(order.itemCount)")
