import XCTest
@testable import Devices

final class iPadMini_Tests: XCTestCase {
    func test_decoding() {
        let data =
        """
        {
            "Generation": "",
            "\\"A\\" Number": "",
            "Bootrom": "",
            "FCC ID": "",
            "Internal Name": "",
            "Identifier": "",
            "Finish": "",
            "Storage": "",
            "Model": ""
        }
        """
            .data(using: .utf8)!
        XCTAssertNoThrow(try JSONDecoder().decode(iPadMini.self, from: data))
    }
}
