

func createSequence(for letter: Character) -> String {
    (UnicodeScalar("A").value...UnicodeScalar(String(letter))!.value)
        .compactMap { UnicodeScalar($0) }
        .map { String($0) }
        .joined()
}

func createRow(index: Int, letter: String) -> String {
    letter +
        String(repeating: " ", count: index == 0 ? 0 : 2 * (index - 1) + 1) +
        letter +
    ","
}

func addLeadingSpaces(index: Int, letter: Substring) -> String {
    String(repeating: " ", count: index) + String(letter)
}

func createPyramid(upperPart: [String]) -> [String] {
    upperPart
}

func wrapIntoArray(character: String) -> [String] {
    return []
}

func printDiamonds(for letter: Character) {
    let sequence = createSequence(for: letter)
    
    let rows = sequence
        .map(String.init)
        .enumerated()
        .map(createRow)
    
    let formattedRows = rows
        .reduce("", +)
        .dropFirst()
        .split(separator: ",")
    
    let leadingSpacedRows = formattedRows
        .reversed()
        .enumerated()
        .map(addLeadingSpaces)
        .reversed()
    
    let upperPart = leadingSpacedRows
        .reduce([[String]](), { [($0.first ?? []) + [$1]] })
    
    let pyramid = upperPart
        .flatMap { [$0, $0.dropLast().reversed()] }
        .joined(separator: [])
        .joined(separator: "\n")
    
    print(pyramid)
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
//printDiamonds(for: "C") == "  A\n BB\nCC"

// Introduce spacing between letters
//printDiamonds(for: "B") == " A\nB B"
//printDiamonds(for: "C") == "  A\n B B\nC  C"

// Symetric
//printDiamonds(for: "B") == " A\nB B\n A"
//printDiamonds(for: "C") == "  A\n B B\nC   C\n B B\n  A"


printDiamonds(for: "G")
