import XCTest
@testable import aoc_2022

final class aoc_2022Tests: XCTestCase {
    func testDay1() {
        let day = Day1()

        let p = day.results()

        XCTAssertEqual(p.p1, "69626")
        XCTAssertEqual(p.p2, "206780")
    }
}