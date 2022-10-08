import XCTest
@testable import Devices

final class Devices_Tests: XCTestCase {
    
    func test_properties() {
        _ = Airpod.all
        _ = Airtag.all
        _ = ApplePencil.all
        _ = AppleTV.all
        _ = AppleWatch.all
        _ = HomePod.all
        _ = iMac.all
        _ = iPad.all
        _ = iPadAir.all
        _ = iPadMini.all
        _ = iPadPro.all
        _ = iPhone.all
        _ = iPodTouch.all
        _ = MacBookAir.all
        _ = MacBookPro.all
        _ = MacMini.all
        _ = SiriRemote.all
        _ = SmartKeyboard.all
    }
    
    func test_generation_of_identifier() {
        let identifier = "iPhone12,5"
        let iPhone = iPhone.all.first { $0.identifier == identifier }!
        XCTAssertEqual("iPhone 11 Pro Max", iPhone.generation)
    }
    
    func test_colors_iPadAir2_64GB() {
        let colors = iPadAir.all.filter {
            $0.generation == "iPad Air 2" &&
            $0.storage == "64 GB"
        }.map { $0.finish }
        XCTAssertEqual(["Gold", "Silver", "Space Gray"], Set(colors).sorted())
    }
    
    func test_appleWatchIdentifiers() {
        let identifiers = AppleWatch.all.map { $0.identifier }
        XCTAssertEqual(
            ["Watch1,1", "Watch1,2", "Watch2,3", "Watch2,4", "Watch2,6", "Watch2,7", "Watch3,1", "Watch3,2", "Watch3,3", "Watch3,4", "Watch4,1", "Watch4,2", "Watch4,3", "Watch4,4", "Watch5,1", "Watch5,10", "Watch5,11", "Watch5,12", "Watch5,2", "Watch5,3", "Watch5,4", "Watch5,9"],
            Set(identifiers).sorted().prefix(22)
        )
    }
    
    func test_models_in_iPadMini2_iPad4_5_Silver_16GB() {
        let iPad = iPadMini.all.first {
            $0.identifier == "iPad4,5" &&
            $0.finish == "Silver" &&
            $0.storage == "16 GB"
        }!
        XCTAssertEqual(
            ["ME814", "ME818", "MF074", "MF075", "MF076", "MF544"],
            iPad.model.components(separatedBy: ", ")
        )
    }
    
    func test_all() {
        let ipad = DeviceList().all["iPad3,6"]!.first!
        XCTAssertEqual(ipad.generation, "iPad (4th generation)")
    }
}
