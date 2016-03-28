/*:
 # [2016-03-21] Challenge #259 [Easy] Clarence the Slow Typist
 
 Published on: 2016-03-21\
 Difficulty: Easy\
 [reddit link](https://www.reddit.com/r/dailyprogrammer/comments/4bc3el/20160321_challenge_259_easy_clarence_the_slow/)
 
 */


//: ## Helper methods
import Foundation

//Lay out the keys visually, and precompute a map from key press to (x,y) coordinate
let keys = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
    [".", "0"],
]
var coordinateMap : [Character:(Int,Int)] = [:]

for (rowIndex, row) in keys.enumerate() {
    for (columnIndex, value) in row.enumerate() {
        coordinateMap[Character(value)] = (rowIndex, columnIndex)
    }
}

// Helper function. z^2 = x^2 + y^2 for distance calculation
func distanceBetweenPoints(firstPoint: (Int, Int), _ secondPoint: (Int, Int)) -> Double {
    let x = Double(secondPoint.0 - firstPoint.0)
    let y = Double(secondPoint.1 - firstPoint.1)
    return sqrt(pow(x, 2) + pow(y, 2))
}

//: ## Main solution function
func calculateDistance(ipAddress:String) -> Double {
    let startingValues : (Double, Character?) = (0, nil);
    let (result, _) = ipAddress.characters.reduce(startingValues) { (tupleData, keyPress) -> (Double, Character?) in
        var (distance, lastKeypress) = tupleData
        
        if let key = lastKeypress,
            lastKeyPoint = coordinateMap[key],
            newKeyPoint = coordinateMap[keyPress] {
            
            distance += distanceBetweenPoints(lastKeyPoint, newKeyPoint)
        }
        
        return (distance, keyPress);
    }
    
    return result
}


//: ## Test run
let testNumber = "219.45.143.143"

testMethod(calculateDistance, withInput: testNumber, expectingOutput: 27, toBeWithin: 0.5)


//: [back to Table of Contents](Table%20of%20Contents)