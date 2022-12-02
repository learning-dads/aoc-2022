import Foundation

class rock: RockPaperScissor {
    var rivalValue = "A"
    var ownValue = "X"
    var pointValue = 1
}

class paper: RockPaperScissor {
    var rivalValue = "B"
    var ownValue = "Y"
    var pointValue = 2
}

class scissors: RockPaperScissor {
    var rivalValue = "C"
    var ownValue = "Z"
    var pointValue = 3
}

protocol RockPaperScissor {
    var rivalValue: String { get }
    var ownValue: String { get }
    var pointValue: Int { get }
}

public class Day2: Puzzle {

    let winConditions = ["X":"C","Y":"X","Z":"B"]
    let winningPoints = 6
    let drawPoints = 3

    override func part1() -> String {
        var totalPoints = 0
        newInput.lines.map { input in
            let components = input.components(separatedBy: .whitespaces)


            //1. Determin pointValue
            totalPoints += foo(components[1])

            //2. Determin if won or draw
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

    func foo(_ input: String) -> RockPaperScissor {
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
}
