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
    
}

class FizzBuzzGenerator {
    func transform(number: Int) -> String {
        return ""
    }
    
    func generate(upTo threshold: Int) -> String {
        return ""
    }
}


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
XCTestSuite.default.run()
