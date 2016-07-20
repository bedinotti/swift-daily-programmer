/*:
 # [2016-01-11] Challenge #249 [Easy] Playing the Stock Market
 
 Published on: 2016-01-11\
 Difficulty: Easy\
 [reddit link](https://www.reddit.com/r/dailyprogrammer/comments/40h9pd/20160111_challenge_249_easy_playing_the_stock/)
 
 */
//: ## Main solution function
import Foundation

func maximizeProfit(input: String) -> String {
    // Convert the input into an array of Doubles
    #if swift(>=3.0)
        let priceStrings = input.characters.split(separator: " ").map(String.init)
    #else
        let priceStrings = input.characters.split(" ").map(String.init)
    #endif
    
    let prices : [Double] = priceStrings.map { stringPrice in
        if let price = Double(stringPrice) {
            return price
        } else {
            return -1
        }
    }

    // For each buy price, pick the max price from the rest of the sequence.
    // If that's more profit than the current buySellTuple, replace it.
    var buySellTuple = (0.0, 0.0)
    #if swift(>=3.0)
        let endOfRange = prices.endIndex.advanced(by: -2)
        let enumeratedRange = prices[prices.startIndex..<endOfRange].enumerated()
    #else
        let endOfRange = prices.endIndex.advancedBy(-2)
        let enumeratedRange = prices[prices.startIndex..<endOfRange].enumerate()
    #endif

    for (index, buyPrice) in enumeratedRange {
        #if swift(>=3.0)
            let newIndex = index.advanced(by: 2)
            let possibleSellPrice = prices[newIndex..<prices.endIndex].max()
        #else
            let newIndex = index.advancedBy(2)
            let possibleSellPrice = prices[newIndex..<prices.endIndex].maxElement()
        #endif
        
        if let sellPrice = possibleSellPrice  {
            let profit = sellPrice - buyPrice;
            if profit > buySellTuple.1 - buySellTuple.0 {
                buySellTuple = (buyPrice, sellPrice)
            }
        } else {
            print("maxElement() wasn't a double somehow")
        }
    }

    return "\(buySellTuple.0) \(buySellTuple.1)"
}

//: ## Test run
let simpleInput = "19.35 19.30 18.88 18.93 18.95 19.03 19.00 18.97 18.97 18.98"
let simpleOutput = "18.88 19.03"

let longInput = "9.20 8.03 10.02 8.08 8.14 8.10 8.31 8.28 8.35 8.34 8.39 8.45 8.38 8.38 8.32 8.36 8.28 8.28 8.38 8.48 8.49 8.54 8.73 8.72 8.76 8.74 8.87 8.82 8.81 8.82 8.85 8.85 8.86 8.63 8.70 8.68 8.72 8.77 8.69 8.65 8.70 8.98 8.98 8.87 8.71 9.17 9.34 9.28 8.98 9.02 9.16 9.15 9.07 9.14 9.13 9.10 9.16 9.06 9.10 9.15 9.11 8.72 8.86 8.83 8.70 8.69 8.73 8.73 8.67 8.70 8.69 8.81 8.82 8.83 8.91 8.80 8.97 8.86 8.81 8.87 8.82 8.78 8.82 8.77 8.54 8.32 8.33 8.32 8.51 8.53 8.52 8.41 8.55 8.31 8.38 8.34 8.34 8.19 8.17 8.16"
let longOutput = "8.03 9.34"



testMethod(method: maximizeProfit, withInput: simpleInput, expectingOutput: simpleOutput)
testMethod(method: maximizeProfit, withInput: longInput, expectingOutput: longOutput)


//: [back to Table of Contents](Table%20of%20Contents)
