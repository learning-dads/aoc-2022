import Foundation

class Rock: RockPaperScissor {
    var rivalValue = "A"
    var ownValue = "X"
    var pointValue = 1
    var type = "Rock"
}

class Paper: RockPaperScissor {
    var rivalValue = "B"
    var ownValue = "Y"
    var pointValue = 2
    var type = "Paper"
}

class Scissors: RockPaperScissor {
    var rivalValue = "C"
    var ownValue = "Z"
    var pointValue = 3
    var type = "Scissors"
}

protocol RockPaperScissor {
    var rivalValue: String { get }
    var ownValue: String { get }
    var pointValue: Int { get }
    var type: String { get }
}

public class Day2: Puzzle {
    let winningPoints = 6
    let drawPoints = 3

    override func part1() -> String {
        let totalPoints = newInput.lines.map { input in
            let components = input.components(separatedBy: .whitespaces)

            //1. Determin pointValue
            let ownFoo = ownFoo(components[1])
            let rivalFoo = rivalFoo(components[0])
            var points = ownFoo.pointValue

            //2. Determin if won or draw
            if ownFoo.type == rivalFoo.type {
                points += drawPoints
            } else if winOver(own: ownFoo, rival: rivalFoo) {
                points += winningPoints
            }
            return points
        }.reduce(0, +)

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
    
    func winOver(own: RockPaperScissor, rival: RockPaperScissor) -> Bool {
        if own.type == Rock().type && rival.type == Scissors().type {
            return true
        }
        if own.type == Paper().type && rival.type == Rock().type {
            return true
        }
        if own.type == Scissors().type && rival.type == Paper().type {
            return true
        }
        return false
    }
}
