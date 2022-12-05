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

enum Shape2 {
    case rock
    case paper
    case scissor
}

extension Shape2 {
    init(_ shape: String) {
        if shape == "A" {
            self = .rock
        } else if shape == "B" {
            self = .paper
        } else {
            self = .scissor
        }
    }

    func play(to condition: GameState) -> Shape2 {
        switch (self, condition) {
            case let (_, condition) where condition == .draw:
                return self
            case let (shape, condition) where condition == .lose:
                return lose(shape)
            case let (shape, condition) where condition == .win:
                return win(shape)
            default: fatalError()
        }
    }

    private func lose(_ shape: Shape2) -> Shape2 {
        switch shape {
            case .paper: return .rock
            case .rock: return .scissor
            case .scissor: return .paper
        }
    }

    private func win(_ shape: Shape2) -> Shape2 {
        switch shape {
            case .paper: return .scissor
            case .rock: return .paper
            case .scissor: return .rock
        }
    }

    func points(_ other: Shape2) -> Int {
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

enum GameState {
    case win
    case lose
    case draw
}

extension GameState {
    init(_ condition: String) {
        if condition == "X" {
            self = .lose
        } else if condition == "Y" {
            self = .draw
        } else {
            self = .win
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
        let totalPoints = newInput.lines
            .map { round in
                let x = round.split(separator: " ")
                let opponent: Shape2 = Shape2(String(x.first!))
                let own = opponent.play(to: GameState(String(x.last!)))
                return [opponent, own]
            }
            .map { player in
                player.last!.shapeValue() + player.first!.points(player.last!)
            }
            .reduce(0) { $0 + $1 }

        return String(describing: totalPoints)
    }
}
