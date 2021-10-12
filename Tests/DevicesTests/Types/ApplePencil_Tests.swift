import XCTest
@testable import Devices

final class ApplePencil_Tests: XCTestCase {
    func test_decoding() {
        let data =
        """
        {
            "Generation": "",
            "\\"A\\" Number": "",
            "FCC ID": "",
            "Internal Name": "",
            "Identifier": "",
            "Model": ""
        }
        """
            .data(using: .utf8)!
        XCTAssertNoThrow(try JSONDecoder().decode(ApplePencil.self, from: data))
    }
}
