import Foundation
import SwiftSoup
import Slab
import Devices
import OrderedCollections

// TODO: Retrieve image from Frames?
// TODO: Get content from wikipedia?
// TODO: Flag to generate from local file
// TODO: Pass mocks to generator

private struct Generator {
    
    private let slab = Slab()
    private let decoder = JSONDecoder()
    private let currentDirectory = URL(fileURLWithPath: #file, isDirectory: false).deletingLastPathComponent()
    
    func generate() throws {

        let newLocation = URL(string: "https://www.theiphonewiki.com/wiki/Models")!
        log("Downloading latest data from \(newLocation)")
        let newString = try String(contentsOf: newLocation, encoding: .utf8)
        let newDocument = try SwiftSoup.parse(newString)
        let newTables = try newDocument.getElementsByTag("table")
        var devices: [DeviceType] = []
        
        let storedLocation = Bundle.module.resourceURL!.appendingPathComponent("Models - The iPhone Wiki.html")
        if FileManager.default.fileExists(atPath: storedLocation.path) {
            let storedString = try String(contentsOf: storedLocation, encoding: .utf8)
            let storedDocument = try SwiftSoup.parse(storedString)
            let storedTables = try storedDocument.getElementsByTag("table")
            
            guard try newTables.outerHtml() != storedTables.outerHtml() else {
                return log("No changes detected since last download")
            }
        }
        
        var output =
        """
        // Generated on \(Date())
        // Manual modifications will be overwitten.
        """
        
        try write(to: &output, from: newTables, at: 1, for: Airpod.self, devices: &devices)
        try write(to: &output, from: newTables, at: 2, for: Airtag.self, devices: &devices)
        try write(to: &output, from: newTables, at: 3, for: AppleTV.self, devices: &devices)
        try write(to: &output, from: newTables, at: 4, for: SiriRemote.self, devices: &devices)
        try write(to: &output, from: newTables, at: 5, for: AppleWatch.self, devices: &devices)
        try write(to: &output, from: newTables, at: 6, for: HomePod.self, devices: &devices)
        try write(to: &output, from: newTables, at: 7, for: iPad.self, devices: &devices)
        try write(to: &output, from: newTables, at: 8, for: ApplePencil.self, devices: &devices)
        try write(to: &output, from: newTables, at: 9, for: SmartKeyboard.self, devices: &devices)
        try write(to: &output, from: newTables, at: 10, for: iPadAir.self, devices: &devices)
        try write(to: &output, from: newTables, at: 11, for: iPadPro.self, devices: &devices)
        try write(to: &output, from: newTables, at: 12, for: iPadMini.self, devices: &devices)
        try write(to: &output, from: newTables, at: 13, for: iPhone.self, devices: &devices)
        try write(to: &output, from: newTables, at: 14, for: iPodTouch.self, devices: &devices)
        try write(to: &output, from: newTables, at: 15, for: iMac.self, devices: &devices)
        try write(to: &output, from: newTables, at: 16, for: MacMini.self, devices: &devices)
        try write(to: &output, from: newTables, at: 17, for: MacBookAir.self, devices: &devices)
        try write(to: &output, from: newTables, at: 18, for: MacBookPro.self, devices: &devices)
        try write(to: &output, from: devices)
        
        try persist(output)
        try persistWiki(newString)
    }

    private func write<T: DeviceType>(to string: inout String, from tables: Elements, at index: Int, for type: T.Type, devices: inout [DeviceType]) throws {
        
        log("Parsing \(type)")
        
        let array = try slab.convert(
            tables[index].outerHtml(),
            configuration:
                    .init(
                        modify: { element, row, col in
                            try element.select("sup").remove()
                            return element
                        }
                    )
        )
        let data = try JSONSerialization.data(withJSONObject: array, options: [])
        let objects = try decoder.decode([T].self, from: data)
        devices.append(contentsOf: objects)
        
        string.append(
        """
        
        
        public extension \(type) {
            static var all: [\(type)] {
                [
        \(try {
            try objects.map { "\t\t\t\(try encode($0))" }.joined(separator: ",\n")
        }())
                ]
            }
        }
        """
        )
    }
    
    private func write(to string: inout String, from devices: [DeviceType]) throws {
        
        log("Writing all")
        
        let dictionary = OrderedDictionary<Identifier, [DeviceType]>(grouping: devices, by: { $0.identifier })
            .reduce(OrderedDictionary<Identifier, [DeviceType]>()) { dictionary, pair in
                var dictionary = dictionary
                pair.key.components(separatedBy: "\\n").forEach {
                    dictionary[String($0)] = pair.value
                }
                return dictionary
            }
        
        
        
        string.append(
        """
        
        
        public struct DeviceList {
        \tpublic let all: [Identifier: [DeviceType]] = [
        \(try {
            try dictionary.map { group in
        """
        \t\t\"\(group.key)\": [
        \(try {
            try group.value.map { "\t\t\t\(try encode($0))" }.joined(separator: ",\n")
        }())
        \t\t]
        """
            }.joined(separator: ",\n")
        }())
        \t]
        }
        """
        )
        
    }
    
    private func persistWiki(_ string: String) throws {
        log("Saving `Models - The iPhone Wiki.html`")
        let ouputDirectory = currentDirectory.appendingPathComponent("Resources/Models - The iPhone Wiki.html")
        let data = string.data(using: .utf8)!
        try data.write(to: ouputDirectory)
    }
    
    private func persist(_ string: String) throws {
        log("Saving `Devices.swift`")
        let ouputDirectory = currentDirectory.appendingPathComponent("../../../Sources/Devices/Devices.swift")
        let data = string.data(using: .utf8)!
        try data.write(to: ouputDirectory)
    }

    private func encode(_ object: Any) throws -> String {
        let objectReflection = Mirror(reflecting: object)
        let params = try objectReflection.children.map { child in
            let value: String = try {
                switch child.value {
                case let array as [String]: return "[\(array.map { "\"\($0)\"" }.joined(separator: ", "))]"
                case let string as String: return "\"\(string)\""
                default: throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown type found during encoding"])
                }
            }()
            return "\(child.label!): \(value)"
        }
            .joined(separator: ", ")

        return "\(type(of: object))(\(params))"
    }
}

func log(_ string: String) {
    print("Devices Generator: \(string)")
}

do {
    log("Started")
    try Generator().generate()
    log("Finished")
    exit(EXIT_SUCCESS)
} catch {
    log("ERROR - \(error.localizedDescription)")
    exit(EXIT_FAILURE)
}
RunLoop.main.run()
