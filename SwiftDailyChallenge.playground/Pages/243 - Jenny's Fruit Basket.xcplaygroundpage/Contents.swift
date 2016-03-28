/*:
 # [2015-12-02] Challenge #243 [Intermediate] Jenny's Fruit Basket
 
 Published on: 2015-12-02\
 Difficulty: Intermediate\
 [reddit link](https://www.reddit.com/r/dailyprogrammer/comments/3v4zsf/20151202_challenge_243_intermediate_jennys_fruit/)
 
 */
//: ## Main solution function

import Foundation

let inventory = [
    (name: "apple", price: 59),
    (name: "banana", price: 32),
    (name: "coconut", price: 155),
    (name: "grapefruit", price: 128),
    (name: "jackfruit", price: 1100),
    (name: "kiwi", price: 41),
    (name: "lemon", price: 70),
    (name: "mango", price: 97),
    (name: "orange", price: 73),
    (name: "papaya", price: 254),
    (name: "pear", price: 37),
    (name: "pineapple", price: 399),
    (name: "watermelon", price: 500),
]


func buyMore(remainingCash : Int, groceryList: [(name:String, price:Int)], shoppingCart : [String:Int] = [:]) -> [[String:Int]]{
    guard remainingCash >= 0 else {
        return []
    }
    guard remainingCash > 0 else {
        return [shoppingCart]
    }
    
    var shorterGroceryList = groceryList
    if let lastFruit = shorterGroceryList.popLast() {
        var newCash = remainingCash
        var newCart = shoppingCart
        var carts : [[String:Int]] = []
        
        while newCash >= 0 {
            // Do this before modifying the cart or cash so that the first time it recurses, it acts like we didn't by
            // any of `lastFruit`
            carts += buyMore(newCash, groceryList: shorterGroceryList, shoppingCart: newCart)
            
            if let purchasedCount = newCart[lastFruit.name] {
                newCart[lastFruit.name] = purchasedCount + 1
            } else {
                newCart[lastFruit.name] = 1
            }
            newCash -= lastFruit.price
        }
        
        return carts
    } else {
        return []
    }
}

func spendFiveDollars() -> [String] {
    // Do the actual shopping
    let carts = buyMore(500, groceryList: inventory)
    
    // Format the output nicely
    let outputStrings = carts.map { (cart : [String: Int]) -> String in
        var quantities : [String] = []
        for (fruit, quantity) in cart {
            if (quantity > 1) {
                quantities.append("\(quantity) \(fruit)s")
            } else {
                quantities.append("\(quantity) \(fruit)")
            }
        }
        return quantities.joinWithSeparator(", ")
    }
    return outputStrings
}

//: ## Manual testing
let carts = spendFiveDollars()

carts.count == 180
carts

