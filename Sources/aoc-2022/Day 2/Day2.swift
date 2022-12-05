import Foundation

enum Shape {
    case rock
    case paper
    case scissor
}

extension Shape {
    init(_ shape: String) {
        if shape == "A" || shape == "X" {
            self = .rock
        } else if shape == "B" || shape == "Y" {
            self = .paper
        } else {
            self = .scissor
        }
    }

    func points(_ other: Shape) -> Int {
        switch (self, other) {
            case let (lhs, rhs) where lhs == rhs:
                return 3
            case let (lhs, rhs) where lhs == .rock && rhs == .paper:
                return 6
            case let (lhs, rhs) where lhs == .paper && rhs == .scissor:
                return 6
            case let (lhs, rhs) where lhs == .scissor && rhs == .rock:
                return 6
            default:
                return 0
        }
    }

    func shapeValue() -> Int {
        switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissor: return 3
        }
    }
}

public class Day2: Puzzle {
    override func part1() -> String {
        let totalPoints = newInput.lines
            .map { round in
                round.split(separator: " ")
                    .map { substring in
                        Shape(String(substring))
                    }
            }
            .map { player in
                player.last!.shapeValue() + player.first!.points(player.last!)
            }
            .reduce(0) { $0 + $1 }

        return String(describing: totalPoints)
    }

    override func part2() -> String {
        return ""
    }
}
