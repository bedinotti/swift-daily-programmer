/*:
 # [2016-05-16] Challenge #267 [Easy] All the places your dog didn't win
 
 Published on: 2016-05-16\
 Difficulty: Easy\
 [reddit link](https://www.reddit.com/r/dailyprogrammer/comments/4jom3a/20160516_challenge_267_easy_all_the_places_your/)
 
 */

func suffix(place : Int) -> String {
    switch place {
    case 11, 12, 13:
        // These are the weird little exceptions.
        return "th"
    case 0..<100 where place % 10 == 1:
        return "st"
    case 0..<100 where place % 10 == 2:
        return "nd"
    case 0..<100 where place % 10 == 3:
        return "rd"
    case place where place >= 100:
        return suffix(place-100)
    default:
        // This is by far the most common
        return "th"
    }
}

func namePlace(place: Int) -> String {
    return "\(place)\(suffix(place))"
}

func allPlaces(to to: Int, from: Int = 1, except : Int? = nil) -> String {
    var range = Array(from...to)
    if let exceptPlace = except {
        range = range.filter { $0 != exceptPlace }
    }
    
    return range.map(namePlace).joinWithSeparator(", ")
}

// Testing
allPlaces(to: 10) == "1st, 2nd, 3rd, 4th, 5th, 6th, 7th, 8th, 9th, 10th"
allPlaces(to: 10, except: 3) == "1st, 2nd, 4th, 5th, 6th, 7th, 8th, 9th, 10th"
allPlaces(to: 20, from: 10) == "10th, 11th, 12th, 13th, 14th, 15th, 16th, 17th, 18th, 19th, 20th"
allPlaces(to: 110, from: 100) == "100th, 101st, 102nd, 103rd, 104th, 105th, 106th, 107th, 108th, 109th, 110th"
allPlaces(to: 116, from: 110, except: 115) == "110th, 111th, 112th, 113th, 114th, 116th"


//: [Table of Contents](Table%20of%20Contents)
