/*:
 # Swift Daily Challenge
 
 Sometimes, I write up the solutions to the challenges on [/r/dailyprogrammer](https://www.reddit.com/r/dailyprogrammer/) in Swift. When I do, I save the code here.
 
 Feedback is welcome!
 
 ## Challenges
 * [[2016-03-21] Challenge #259 [Easy] Clarence the Slow Typist]("%5B2016-03-21%5D%20Challenge%20%23259%20%5BEasy%5D%20Clarence%20the%20Slow%20Typist")
 */

//: [Next](@next)

let link = "[2016-03-21] Challenge #259 [Easy] Clarence the Slow Typist"

let result = link.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())

print(result)