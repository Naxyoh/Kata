import XCTest

struct FizzBuzzRule: Equatable {
    let replacement: String
    let isEligible: (_ number: Int) -> Bool
    
    private let id = UUID()
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

struct FizzBuzzGenerator {
    
    let rules: [FizzBuzzRule]
    
    func applyRules(to number: Int) -> String {
        var result = ""
        rules.forEach { rule in
            if rule.isEligible(number) {
                result += rule.replacement
            }
        }
        return result.isEmpty ? "\(number)" : result
    }
    
    func generate(upTo number: Int) -> [String] {
        return (1...number)
            .map(applyRules)
    }
    
}

// MARK: - Tests

class FizzBuzzTests: XCTestCase {
    
    var sut: FizzBuzzGenerator!
    
    override func setUp() {
        super.setUp()
        
    }
    
    func test_generate_withoutRules_doesNotTransformValues() {
        // Given
        sut = FizzBuzzGenerator(rules: [])
        
        // When
        let result = sut.generate(upTo: 10)
        
        // Then
        XCTAssertEqual(result, Array(1...10).map(String.init))
    }
    
    func test_isInitializedWithGivenRules() {
        // Given
        let fizzRule = FizzBuzzRule(replacement: "Fizz", isEligible: { $0 % 3 == 0 })
        
        // When
        sut = FizzBuzzGenerator(rules: [fizzRule])
        
        // Then
        XCTAssertEqual(sut.rules, [fizzRule])
    }
    
    func test_generate_appliesRules_whenOneRuleApplies() {
        // Given
        let fizzRule = FizzBuzzRule(replacement: "Fizz", isEligible: { $0 % 3 == 0 })
        sut = FizzBuzzGenerator(rules: [fizzRule])
        
        // When
        let result = sut.generate(upTo: 5)
        
        // Then
        XCTAssertEqual(result, ["1", "2", "Fizz", "4", "5"])
    }
    
    func test_generate_appliesRules_whenSeveralRulesApplyToOneNumber() {
        // Given
        let evenRule = FizzBuzzRule(replacement: "Even", isEligible: { $0 % 2 == 0 })
        let fizzRule = FizzBuzzRule(replacement: "Fizz", isEligible: { $0 % 3 == 0 })
        sut = FizzBuzzGenerator(rules: [evenRule, fizzRule])
        
        // When
        let result = sut.generate(upTo: 6)
        
        // Then
        XCTAssertEqual(result, ["1", "Even", "Fizz", "Even", "5", "EvenFizz"])
    }

}

// MARK: - Example

let generator = FizzBuzzGenerator(
    rules: [
        FizzBuzzRule(replacement: "Fizz", isEligible: { $0 % 3 == 0 }),
        FizzBuzzRule(replacement: "Buzz", isEligible: { $0 % 5 == 0 })
    ]
)
let fizzBuzzSequence = generator.generate(upTo: 30)
print(fizzBuzzSequence.joined(separator: "\n"))


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
// Uncomment to run the test suite associated with `FizzBuzzTests`
//FizzBuzzTests.defaultTestSuite.run()
