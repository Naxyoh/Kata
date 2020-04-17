extension String {
    func wrapInArray() -> [String] {
        self.reduce([String](), { [($0 + [String($1)]).joined()] })
    }
    
    func duplicateEachCharacter() {
        
    }
}

func createSequence(for letter: Character) -> String {
    (UnicodeScalar("A").value...UnicodeScalar(String(letter))!.value)
        .compactMap { UnicodeScalar($0) }
        .map { String($0) }
        .joined()
}





func printDiamonds(for letter: Character) -> String {
    let result = createSequence(for: letter)
        .map { character -> String in String(character) + String(character) + "," }
        .reduce("", +)
        .dropFirst()
        .split(separator: ",")
        .reversed()
        .enumerated()
        .map { String(repeating: " ", count: $0) + $1 }
        .reversed()
        .joined(separator: "\n")
        
    print(result)
    return result
}

// PrintDiamonds for 'A' returns 'A'
//printDiamonds(for: "A") == "A"

// Sequence
//printDiamonds(for: "C") == "ABC"

// Repeats
//printDiamonds(for: "C") == "ABBCC"

// Introduce new lines
//printDiamonds(for: "C") == "A\nBB\nCC"

// Introduce leading spaces
//printDiamonds(for: "B") == " A\nBB"
printDiamonds(for: "C") == "  A\n BB\nCC"

// Introduce spacing between letters
//printDiamonds(for: "B") == " A\nB B"
//printDiamonds(for: "C") == "  A\n B B\nC  C"

// Symetric
//printDiamonds(for: "B") == " A\nB B\n A"
