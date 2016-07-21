import Foundation

// Swift 2.2 wrappers
#if swift(>=3.0)
#else
    public func testMethod<InputType, OutputType : Equatable> (
        method method: (InputType) -> OutputType,
        withInput input: InputType,
        expectingOutput output: OutputType
        ) -> Bool {
        return testMethod(method, withInput:input, expectingOutput: output)
    }
    
    public func testMethod<InputType, OutputType : Strideable> (
        method method: (InputType) -> OutputType,
        withInput input: InputType,
        expectingOutput output: OutputType,
        toBeWithin marginOfError: OutputType.Stride
        ) -> Bool {
        return testMethod(method, withInput: input, expectingOutput: output, toBeWithin:marginOfError)
    }
    
#endif

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
