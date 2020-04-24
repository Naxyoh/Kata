import XCTest

class FizzBuzzTests: XCTestCase {
    
    var sut: FizzBuzzGenerator!
    
    override func setUp() {
        sut = FizzBuzzGenerator()
    }
    
    func test_transform_returnsPassedValue_whenNoTransformationNeeded() {
        // When
        let result = sut.transform(number: 1)
        
        // Then
        XCTAssertEqual(result, "1")
    }
    
    func test_transform_returnsFizz_whenPassedValueIsMultipleOfThree() {
        // When
        let result = sut.transform(number: 3)
        
        // Then
        XCTAssertEqual(result, "Fizz")
    }
    
    func test_transform_returnsBuzz_whenPassedValueIsMultipleOfFive() {
        // When
        let result = sut.transform(number: 5)
        
        // Then
        XCTAssertEqual(result, "Buzz")
    }
    
    func test_transform_returnsFizzBuzz_whenPassedValueIsMultipleOfThreeAndFive() {
        // When
        let result = sut.transform(number: 15)
        
        // Then
        XCTAssertEqual(result, "FizzBuzz")
    }
    
    func test_generate_appliesTransfrom_upToPassedValue() {
        // When
        let result = sut.generate(upTo: 5)
        
        // Then
        XCTAssertEqual(result, ["1", "2", "Fizz", "4", "Buzz"])
    }
}

class FizzBuzzGenerator {
    func transform(number: Int) -> String {
        var transformed = ""
        transformed += (number % 3 == 0) ? "Fizz" : ""
        transformed += (number % 5 == 0) ? "Buzz" : ""
        return transformed.isEmpty ? "\(number)" : transformed
    }
    
    func generate(upTo threshold: Int) -> [String] {
        return (1...threshold)
            .map(transform)
    }
}

// Uncomment to see the beauty of the FizzBuzz up to 20
//print(FizzBuzzGenerator().generate(upTo: 20).joined(separator: "\n"))


// MARK: - Test utils

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int
    ) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
// Uncomment to run the test suite assocciated with `FizzBuzzTests`
//FizzBuzzTests.defaultTestSuite.run()
