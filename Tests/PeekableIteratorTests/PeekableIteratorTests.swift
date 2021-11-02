import XCTest
@testable import PeekableIterator

final class PeekableIteratorTests: XCTestCase {
    func testPeekFirstElement() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let text = "foobar"
        let iter = text.peekable()

        XCTAssertEqual(iter.peek(), "f")
    }

    func testPeekEmptyIterator() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let array = [Int]()
        let iter = array.peekable()

        XCTAssertEqual(iter.peek(), nil)
    }

    func testPeekNthElement() {
        let array = [1, 2, 3, 4, 5]
        var iter = array.peekable()

        let _ = iter.next()
        let _ = iter.next()

        XCTAssertEqual(iter.peek(), 3)
    }

    func testNextConsumesTheWholeIterator() {
        let array = [1, 2, 3, 4, 5]
        var iter = array.peekable()

        var item : Int?
        repeat {
            item = iter.next()
        } while item != nil

        XCTAssertTrue(true)
    }
}
