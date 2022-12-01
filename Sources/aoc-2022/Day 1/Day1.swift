import Foundation

public class Day1: Puzzle {
    override func part1() -> String {
        let calories = newInput
            .lines
            .split(separator: "")
            .map { $0.reduce(0) { count, calories in
                count + Int(calories)!
            } }

        return "\(String(describing: calories.max()!))"
    }

    override func part2() -> String {
        let calories = newInput
            .lines
            .split(separator: "")
            .map { $0.reduce(0) { count, calories in
                count + Int(calories)!
            } }

        let result = calories
            .sorted()
            .suffix(3)
            .reduce(0) { count, calories in
                count + Int(calories)
            }

        return "\(String(describing: result))"
    }
}
