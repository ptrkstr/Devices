import XCTest
@testable import Devices

final class SiriRemote_Tests: XCTestCase {
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
        XCTAssertNoThrow(try JSONDecoder().decode(SiriRemote.self, from: data))
    }
}
