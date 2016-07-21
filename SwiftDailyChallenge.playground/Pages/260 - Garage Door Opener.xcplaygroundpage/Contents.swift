/*:
 # [2016-03-21] Challenge #259 [Easy] Clarence the Slow Typist
 
 Published on: 2016-03-28\
 Difficulty: Easy\
 [reddit link](https://www.reddit.com/r/dailyprogrammer/comments/4cb7eh/20160328_challenge_260_easy_garage_door_opener/)
 
 */

import Foundation

enum GarageState : CustomStringConvertible {
    case Closed, Open, Opening, Closing, StoppedWhileClosing, StoppedWhileOpening
    
    var description: String {
        var suffix = "UNKNOWN"
        
        switch(self) {
        case .Closed:
            suffix = "CLOSED"
        case .Opening:
            suffix = "OPENING"
        case .Closing:
            suffix = "CLOSING"
        case .Open:
            suffix = "OPEN"
        case .StoppedWhileClosing:
            suffix = "STOPPED_WHILE_CLOSING"
        case .StoppedWhileOpening:
            suffix = "STOPPED_WHILE_OPENING"
        }
        
        return "Door: " + suffix
    }
}

enum GarageInputs: String {
    case ClickButton = "button_clicked"
    case WaitForCycleToComplete = "cycle_complete"
}


func playWithDoor(defaultState : GarageState, inputs: [GarageInputs]) -> [String] {
    var state = defaultState;
    var output: [String] = [state.description];
    
    inputs.forEach { input in
        // Echo input state to output log
        switch (input) {
        case .ClickButton:
            output.append("> Button clicked.")
        case .WaitForCycleToComplete:
            output.append("> Cycle complete.")
        }
        
        // Choose the new state
        switch(input, state) {
        case (.ClickButton, .Closed):
            state = .Opening
        case (.ClickButton, .Open):
            state = .Closing
        case (.ClickButton, .Opening):
            state = .StoppedWhileOpening
        case (.ClickButton, .Closing):
            state = .StoppedWhileClosing
        case (.ClickButton, .StoppedWhileOpening):
            state = .Closing
        case (.ClickButton, .StoppedWhileClosing):
            state = .Opening
        case (.WaitForCycleToComplete, .Opening):
            state = .Open
        case (.WaitForCycleToComplete, .Closing):
            state = .Closed
        default: break
        }
        
        output.append(state.description)
    }
    return output;
}

#if swift(>=3.0)
#else
    func playWithDoor(defaultState defaultState : GarageState, inputs: [GarageInputs]) -> [String] {
        return playWithDoor(defaultState, inputs: inputs)
    }
#endif


//: Testing
let simpleInput = [
    "button_clicked",
    "cycle_complete",
    "button_clicked",
    "button_clicked",
    "button_clicked",
    "button_clicked",
    "button_clicked",
    "cycle_complete",
]
let expectedOutput = [
    "Door: CLOSED",
    "> Button clicked.",
    "Door: OPENING",
    "> Cycle complete.",
    "Door: OPEN",
    "> Button clicked.",
    "Door: CLOSING",
    "> Button clicked.",
    "Door: STOPPED_WHILE_CLOSING",
    "> Button clicked.",
    "Door: OPENING",
    "> Button clicked.",
    "Door: STOPPED_WHILE_OPENING",
    "> Button clicked.",
    "Door: CLOSING",
    "> Cycle complete.",
    "Door: CLOSED",
]

let transformedInput = simpleInput.map { input in
    return GarageInputs(rawValue: input)!
}

let output = playWithDoor(defaultState: .Closed, inputs: transformedInput)

output == expectedOutput


//: [back to Table of Contents](Table%20of%20Contents)
