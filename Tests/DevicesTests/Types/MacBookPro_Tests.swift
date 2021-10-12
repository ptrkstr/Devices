import XCTest
@testable import Devices

final class MacBookPro_Tests: XCTestCase {
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
            "Color": "",
            "Storage": "",
            "Model": ""
        }
        """
            .data(using: .utf8)!
        XCTAssertNoThrow(try JSONDecoder().decode(MacBookPro.self, from: data))
    }
}
