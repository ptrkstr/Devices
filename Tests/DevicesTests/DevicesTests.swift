import XCTest
@testable import Devices

final class DevicesTests: XCTestCase {
    
    func test_counts() {
        XCTAssertEqual(4, Airpod.all.count)
        XCTAssertEqual(2, Airtag.all.count)
        XCTAssertEqual(2, ApplePencil.all.count)
        XCTAssertEqual(11, AppleTV.all.count)
        XCTAssertEqual(175, AppleWatch.all.count)
        XCTAssertEqual(6, HomePod.all.count)
        XCTAssertEqual(18, iMac.all.count)
        XCTAssertEqual(124, iPad.all.count)
        XCTAssertEqual(80, iPadAir.all.count)
        XCTAssertEqual(121, iPadMini.all.count)
        XCTAssertEqual(257, iPadPro.all.count)
        XCTAssertEqual(659, iPhone.all.count)
        XCTAssertEqual(80, iPodTouch.all.count)
        XCTAssertEqual(6, MacBookAir.all.count)
        XCTAssertEqual(4, MacBookPro.all.count)
        XCTAssertEqual(2, MacMini.all.count)
        XCTAssertEqual(3, SiriRemote.all.count)
        XCTAssertEqual(5, SmartKeyboard.all.count)
    }

    func test_deserialisations() {
        
    }
}
