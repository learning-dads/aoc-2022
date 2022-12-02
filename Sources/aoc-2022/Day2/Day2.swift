import Foundation


public class Day2: Puzzle {

    let rock = (rivalValue: "A", ownValue: "X", pointValue: 1)
    let paper = (rivalValue: "B", ownValue: "Y", pointValue: 2)
    let scissors = (rivalValue: "C", ownValue: "Z", pointValue: 3)

    let winConditions = ["X":"C","Y":"X","Z":"B"]
    let winningPoints = 6
    let drawPoints = 3

    override func part1() -> String {
        
    }
    //1. Deterin pointValue
    //2. Determin if won or draw
}
