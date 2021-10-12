import XCTest
@testable import Devices

final class AppleWatch_Tests: XCTestCase {
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
            "Case Material": "",
            "Finish": "",
            "Case Size": "",
            "Model": ""
        }
        """
            .data(using: .utf8)!
        XCTAssertNoThrow(try JSONDecoder().decode(AppleWatch.self, from: data))
    }
}
