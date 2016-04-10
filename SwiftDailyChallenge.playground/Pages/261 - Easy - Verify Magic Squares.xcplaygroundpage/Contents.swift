/*:
 # [2016-04-04] Challenge #261 [Easy] verifying 3x3 magic squares
 
 Published on: 2016-04-04\
 Difficulty: Easy\
 [reddit link](https://www.reddit.com/r/dailyprogrammer/comments/4dccix/20160404_challenge_261_easy_verifying_3x3_magic/)
 
 */
import Foundation

// Define the magic square. Play with ArrayLiteralConvertable
struct MagicSquare {
    let size : Int
    let linearContents : [Int]
    let twoDimensionalContents : [[Int]]
}

extension MagicSquare : ArrayLiteralConvertible {
    typealias Element = Int
    

    
    init(arrayLiteral elements: Int...) {
        self.init(withArray: elements)
    }
    
    init(withArray elements : [Int]) {
        // Figure out the size of square
        let actualSize = Int(ceil(sqrt(Double(elements.count))))
        
        // Fill in any remaining squares if we weren't given sufficient information.
        let paddedElements : [Int]
        if elements.count == actualSize {
            paddedElements = elements
        } else {
            // Right now, pad any missing elements with 0's. Might need to make the contents optionals to support later problems
            paddedElements = elements + Array(count: actualSize, repeatedValue: 0)
        }
        
        // Build the 2d contents
        var twoDimensionalContents : [[Int]] = []
        var startingIndex = 0
        actualSize.stride(through: actualSize * actualSize, by: actualSize).forEach { newIndex in
            let subrange = paddedElements[startingIndex..<newIndex]
            twoDimensionalContents.append(Array(subrange))
            startingIndex = newIndex
        }
        
        // Save the properties
        size = actualSize
        linearContents = elements
        self.twoDimensionalContents = twoDimensionalContents
    }
    

}

extension MagicSquare {
    func isValid() -> Bool {
        let targetSum = size * (size * size + 1) / 2
        
        let areAllRowsValid = self.twoDimensionalContents.reduce(true) { (isValidSoFar, row) -> Bool in
            guard isValidSoFar else {
                // short circuit if we already found an invalid row
                return false
            }
            
            let rowSum = row.reduce(0, combine: +)

            return rowSum == targetSum
        }
        
        let areAllColumnsValid = (0..<size).reduce(true) { (isValidSoFar, columnIndex) -> Bool in
            guard isValidSoFar else {
                return false
            }
            
            let columnSum = twoDimensionalContents.reduce(0) { (sumSoFar, row) -> Int in
                return sumSoFar + row[columnIndex]
            }
            
            return columnSum == targetSum
        }
        
        let uphillSum = (0..<size).reduce(0) { (sumSoFar, index) -> Int in
            return sumSoFar + twoDimensionalContents[index][index]
        }
        let downhillSum = (0..<size).reduce(0) { (sumSoFar, index) -> Int in
            return sumSoFar + twoDimensionalContents[index][size - index - 1]
        }
        let isUphillDiagonalValid = uphillSum == targetSum
        let isDownhillDiagonalValid = downhillSum == targetSum
        
        
        return areAllRowsValid
            && areAllColumnsValid
            && isUphillDiagonalValid
            && isDownhillDiagonalValid
    }
}




// Test it out
let trueSquare1 : MagicSquare = [8, 1, 6, 3, 5, 7, 4, 9, 2]

print(trueSquare1.isValid())


//: ## Test run
//: This method is just needed to adapt the isValid method to something my testing functions can call
func verify(numbers : [Int]) -> Bool {
    let magicSquare = MagicSquare(withArray: numbers)
    return magicSquare.isValid()
}

let trueInput1 = [8, 1, 6, 3, 5, 7, 4, 9, 2]
let trueInput2 = [2, 7, 6, 9, 5, 1, 4, 3, 8]
let falseInput1 = [3, 5, 7, 8, 1, 6, 4, 9, 2]
let falseInput2 = [8, 1, 6, 7, 5, 3, 4, 9, 2]



testMethod(verify, withInput: trueInput1, expectingOutput: true)
testMethod(verify, withInput: trueInput2, expectingOutput: true)
testMethod(verify, withInput: falseInput1, expectingOutput: false)
testMethod(verify, withInput: falseInput2, expectingOutput: false)


//: [back to Table of Contents](Table%20of%20Contents)
