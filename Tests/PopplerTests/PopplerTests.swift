import XCTest
@testable import Poppler

final class PopplerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(getVersionString(), "22.05.0")
    }
}
