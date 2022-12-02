import Foundation

class Rock: RockPaperScissor {
    var rivalValue = "A"
    var ownValue = "X"
    var pointValue = 1
}

class Paper: RockPaperScissor {
    var rivalValue = "B"
    var ownValue = "Y"
    var pointValue = 2
}

class Scissors: RockPaperScissor {
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
            let ownFoo = ownFoo(components[1])
            let rivalFoo = rivalFoo(components[0])
            totalPoints += ownFoo.pointValue

            //2. Determin if won or draw
            if type(of: ownFoo) == type(of: rivalFoo) {
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

    func ownFoo(_ input: String) -> RockPaperScissor {
        switch input {
        case Rock().ownValue:
            return Rock()
        case Paper().ownValue:
            return Paper()
        case Scissors().ownValue:
            return Scissors()
        default: fatalError()
        }
    }

    func rivalFoo(_ input: String) -> RockPaperScissor {
        switch input {
        case Rock().rivalValue:
            return Rock()
        case Paper().rivalValue:
            return Paper()
        case Scissors().rivalValue:
            return Scissors()
        default: fatalError()
        }
    }
}
