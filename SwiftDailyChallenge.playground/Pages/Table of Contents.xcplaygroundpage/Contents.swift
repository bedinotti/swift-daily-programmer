/*:
 # Swift Daily Challenge
 
 Sometimes, I write up the solutions to the challenges on [/r/dailyprogrammer](https://www.reddit.com/r/dailyprogrammer/) in Swift. When I do, I save the code here.
 
 Feedback is welcome!
 
 ## Challenges
 * [261 - Easy - Verify Magic Squares](261%20-%20Easy%20-%20Verify%20Magic%20Squares)
 * [260 - Garage Door Opener](260%20-%20Garage%20Door%20Opener)
 * [259 - Clarence the Slow Typist](259%20-%20Clarence%20the%20Slow%20Typist)
 * [249 - Playing the Stock Market](249%20-%20Playing%20the%20Stock%20Market)
 * [243 - Jenny's Fruit Basket](243%20-%20Jenny's%20Fruit%20Basket)
 */

//: [Next](@next)


// Helpful code to generate links. 
let link = "261 - Easy - Verify Magic Squares"

if let result = link.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
    print(result)
}



let x : [Int?] = [1, nil, 2]

x.reduce(true) { (soFar, possibleNil) -> Bool in
    guard soFar else {
        return false
    }
    return possibleNil != nil
}

let y = x.flatMap { $0 }
print(y)