import XCTest
@testable import Devices

final class Airpod_Tests: XCTestCase {
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
            "Model": ""
        }
        """
            .data(using: .utf8)!
        XCTAssertNoThrow(try JSONDecoder().decode(Airpod.self, from: data))
    }
}
