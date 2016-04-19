/*:
 # [2016-04-18] Challenge #263 [Easy] Calculating Shannon Entropy of a String
 
 Published on: 2016-04-11\
 Difficulty: Easy\
 [reddit link](https://www.reddit.com/r/dailyprogrammer/comments/4fc896/20160418_challenge_263_easy_calculating_shannon/)
 
 */

func entropy(input : String) -> Double {
    return 0
}



entropy("1223334444")
testMethod(entropy, withInput: "1223334444", expectingOutput: 1.84644, toBeWithin: 0.0001)
testMethod(entropy, withInput: "Hello, World!", expectingOutput: 3.18083, toBeWithin: 0.0001)

// Challenge Input
testMethod(entropy, withInput: "122333444455555666666777777788888888", expectingOutput: 2.794208683, toBeWithin: 0.0001)
testMethod(entropy, withInput: "563881467447538846567288767728553786", expectingOutput: 2.794208683, toBeWithin: 0.0001)
testMethod(entropy, withInput: "https://www.reddit.com/r/dailyprogrammer", expectingOutput: 4.056198332, toBeWithin: 0.0001)
testMethod(entropy, withInput: "int main(int argc, char *argv[])", expectingOutput: 3.866729296, toBeWithin: 0.0001)





//: [Table of Contents](Table%20of%20Contents)