func printDiamonds(for character: Character) -> String {
    
    let firstHex = Character("A").asciiValue ?? 0
    let lastHex = Character(character.uppercased()).asciiValue ?? 0
    
    var sequence = [String]()
    let interval = Int(lastHex-firstHex)
    
    (firstHex...lastHex)
        .enumerated()
        .forEach { index, hex in
            var row = [Character]()
            row.append(contentsOf: String(repeating: " ", count: interval - index))
            row.append(Character(Unicode.Scalar(hex)))
            if hex != firstHex {
                row.append(contentsOf: String(repeating: " ", count: 2*(index - 1) + 1))
                row.append(Character(Unicode.Scalar(hex)))
            }
            sequence.append(String(row))
    }
    let result = sequence + sequence.dropLast().reversed()
    return result.joined(separator: "\n")
}

// Print
//printDiamonds(for: "A") == "A"

// Sequence
//printDiamonds(for: "B") == "AB"

// Repeats
//printDiamonds(for: "B") == "ABB"

// Introduce new lines
//printDiamonds(for: "B") == "A\nBB"

// Introduce leading spaces
//printDiamonds(for: "B") == " A\nBB"
//printDiamonds(for: "C") == "  A\n BB\nCC"

// Introduce spacing between letters
//printDiamonds(for: "B") == " A\nB B"
//printDiamonds(for: "C") == "  A\n B B\nC  C"

// Symetric
//printDiamonds(for: "B") == " A\nB B\n A"

print(printDiamonds(for: "G"))


