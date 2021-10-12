import XCTest
@testable import Devices

final class SmartKeyboard_Tests: XCTestCase {
    func test_decoding() {
        let data =
        """
        {
            "Generation": "",
            "\\"A\\" Number": "",
            "Internal Name": "",
            "Identifier": "",
            "iPad Compatibility": "",
            "Model": ""
        }
        """
            .data(using: .utf8)!
        XCTAssertNoThrow(try JSONDecoder().decode(SmartKeyboard.self, from: data))
    }
}
