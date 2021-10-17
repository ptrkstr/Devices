import XCTest
@testable import Devices
import SwiftSoup
import Slab

// TODO: Download HTML doc, don't store it

final class DevicesTests: XCTestCase {
    
    func testAAA() {
        iPhone.all.forEach {
            print($0.identifier)
        }
    }

}
