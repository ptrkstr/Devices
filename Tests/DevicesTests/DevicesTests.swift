//import XCTest
//@testable import Devices
//import SwiftSoup
//import Slab
//
//// TODO: Download HTML doc, don't store it
//
//final class DevicesTests: XCTestCase {
//    
//    func testAAA() {
////        aaa()
//        
//    }
//    
//    func testExample() throws {
//        let url = Bundle.module.resourceURL!.appendingPathComponent("Models - The iPhone Wiki.html")
//        let html = try String(contentsOf: url, encoding: .utf8)
//        let doc = try SwiftSoup.parse(html)
//        let tables = try doc.getElementsByTag("table")
//        let slab = Slab()
//        
//        let aaa = try slab.convert(tables[1].outerHtml())
//        let serialise = try JSONSerialization.data(withJSONObject: aaa, options: [])
//        let airpods = try JSONDecoder().decode([Airpod].self, from: serialise)
//        
//        print("[")
//        for airpod in airpods {
//            print("\t\(try encode(airpod)),")
//        }
//        print("].lazy")
//        
////        print()
//    }
//    
//    
//    
//    func encode(_ airpod: Airpod) throws -> String {
//        let airpod = Mirror(reflecting: airpod)
//        let params = try airpod.children.map { child in
//            let value: String = try {
//                switch child.value {
//                case let array as [String]: return "[\(array.map { "\"\($0)\"" }.joined(separator: ", "))]"
//                case let string as String: return "\"\(string)\""
//                default: throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown type found during encoding"])
//                }
//            }()
//            return "\(child.label!): \(value)"
//        }
//            .joined(separator: ", ")
//        
//        return ".init(\(params))"
//    }
//}
