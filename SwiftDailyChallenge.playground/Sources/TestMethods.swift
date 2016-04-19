import Foundation

// Use these functions to test your daily problem solutions.

public func testMethod<InputType, OutputType : Equatable> (
    method: (InputType) -> OutputType,
    withInput input: InputType,
    expectingOutput output: OutputType
    ) -> Bool {
    
    let actualResult = method(input)
    return actualResult == output
}
//
//public func testMethod<InputType, OutputType : SequenceType where OutputType.Generator.Element : Equatable> (
//    method: (InputType) -> OutputType,
//    withInput input: InputType,
//    expectingOutput output: OutputType
//    ) -> Bool {
//    return false
//}

public func testMethod<InputType, OutputType : Strideable> (
    method: (InputType) -> OutputType,
    withInput input: InputType,
    expectingOutput output: OutputType,
    toBeWithin marginOfError: OutputType.Stride
    ) -> Bool {
    
    let actualResult = method(input)
    
    let errorStart = actualResult - marginOfError;
    let errorEnd = actualResult + marginOfError;
    
    return (errorStart...errorEnd).contains(output)
}
