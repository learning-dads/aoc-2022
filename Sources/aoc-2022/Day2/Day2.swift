import Foundation


public class Day2: Puzzle {

    let rock = (rivalValue: "A", ownValue: "X", pointValue: 1)
    let paper = (rivalValue: "B", ownValue: "Y", pointValue: 2)
    let scissors = (rivalValue: "C", ownValue: "Z", pointValue: 3)

    let winConditions = ["X":"C","Y":"X","Z":"B"]
    let winningPoints = 6
    let drawPoints = 3

    override func part1() -> String {
        var totalPoints = 0
        newInput.lines.map { input in
            let components = input.components(separatedBy: .whitespaces)
            totalPoints += foo(components[1])

            if components[0] == components[1] {
                totalPoints += drawPoints
            } else if winConditions[components[1]] == components[0] {
                totalPoints += winningPoints
            }
        }

        return String(describing: totalPoints)
    }

    override func part2() -> String {
        return "fred"
    }

    func foo(_ input: String) -> Int {
        switch input {
        case rock.ownValue:
            return rock.pointValue
        case paper.ownValue:
            return paper.pointValue
        case scissors.ownValue:
            return scissors.pointValue
        default: return 0
        }
    }
    //1. Deterin pointValue
    //2. Determin if won or draw
}
