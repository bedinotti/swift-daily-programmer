/*:
 # [2016-04-11] Challenge #262 [Easy] MaybeNumeric
 
 Published on: 2016-04-11\
 Difficulty: Easy\
 [reddit link](https://www.reddit.com/r/dailyprogrammer/comments/4eaeff/20160411_challenge_262_easy_maybenumeric/)
 
 */
import Foundation

enum MaybeNumber {
    case NotNumber(String)
    case Number(Double)
}

//# Equality conformance so I can use my testMethod
extension MaybeNumber: Equatable {}
func ==(left : MaybeNumber, right: MaybeNumber) -> Bool {
    // This will be easier in Swift 3
    // https://github.com/apple/swift-evolution/blob/master/proposals/0043-declare-variables-in-case-labels-with-multiple-patterns.md
    switch left {
    case .NotNumber(let leftString):
        switch right {
        case .NotNumber(let rightString):
            return leftString == rightString
        default:
            return false
        }
    case .Number(let leftDouble):
        switch right {
        case .Number(let rightDouble):
            return leftDouble == rightDouble
        default:
            return false
        }
    }
}

func parseInput(input: String) -> MaybeNumber {
    if let numericValue = Double(input) {
        return .Number(numericValue)
    } else {
        return MaybeNumber.NotNumber(input)
    }
}

//: Part 1
testMethod(parseInput, withInput: "123", expectingOutput: .Number(123))
testMethod(parseInput, withInput: "44.234", expectingOutput: .Number(44.234))
testMethod(parseInput, withInput: "0x123N", expectingOutput: .NotNumber("0x123N"))


//: [Table of Contents](Table%20of%20Contents)

Double("2345.343")
Double("haha")
Double("3.23e5")
Double("1293712938712938172938172391287319237192837329")
Double(".25")
