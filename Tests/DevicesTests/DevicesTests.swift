import XCTest
@testable import Devices

//import UIKit

final class DevicesTests: XCTestCase {
    
//    func test_counts() {
//        XCTAssertEqual(4, Airpod.all.count)
//        XCTAssertEqual(2, Airtag.all.count)
//        XCTAssertEqual(2, ApplePencil.all.count)
//        XCTAssertEqual(11, AppleTV.all.count)
//        XCTAssertEqual(175, AppleWatch.all.count)
//        XCTAssertEqual(6, HomePod.all.count)
//        XCTAssertEqual(18, iMac.all.count)
//        XCTAssertEqual(124, iPad.all.count)
//        XCTAssertEqual(80, iPadAir.all.count)
//        XCTAssertEqual(121, iPadMini.all.count)
//        XCTAssertEqual(257, iPadPro.all.count)
//        XCTAssertEqual(659, iPhone.all.count)
//        XCTAssertEqual(80, iPodTouch.all.count)
//        XCTAssertEqual(6, MacBookAir.all.count)
//        XCTAssertEqual(4, MacBookPro.all.count)
//        XCTAssertEqual(2, MacMini.all.count)
//        XCTAssertEqual(3, SiriRemote.all.count)
//        XCTAssertEqual(5, SmartKeyboard.all.count)
//    }

    func test_deserialisations() {
//        let aaaa = UIDevice.current.identifier
//        print()
//        let iphone = iPhone.all.first { $0.identifier == identifier }
        
//        let generation = "iPad Air 2"
//        let storage = "64 GB"
//        let colors = iPadAir.all.filter { $0.generation == generation && $0.storage == storage }.map { $0.finish }
//        Set(colors)
        
//        let identifiers = AppleWatch.all.map { $0.identifier }
//        print(Set(identifiers).sorted())
        
        let colors = iPadAir.all.filter {
            $0.generation == "iPad Air 2" &&
            $0.storage == "64 GB"
        }.map { $0.finish }
        
        let iPad = iPadMini.all.first {
            $0.identifier == "iPad4,5" &&
            $0.finish == "Silver" &&
            $0.storage == "16 GB"
        }!
        print(iPad.model.components(separatedBy: ", "))

    }
}
