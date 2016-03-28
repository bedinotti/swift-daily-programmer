/*:
 # Swift Daily Challenge
 
 Sometimes, I write up the solutions to the challenges on [/r/dailyprogrammer](https://www.reddit.com/r/dailyprogrammer/) in Swift. When I do, I save the code here.
 
 Feedback is welcome!
 
 ## Challenges
 * [259 - Clarence the Slow Typist](259%20-%20Clarence%20the%20Slow%20Typist)
 * [249 - Playing the Stock Market](249%20-%20Playing%20the%20Stock%20Market)
 */

//: [Next](@next)

let link = "249 - Playing the Stock Market"

let result = link.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())

print(result)