public typealias Identifier = String
public typealias Generation = String

public protocol DeviceType: Decodable {
    var identifier: Identifier { get }
    var generation: Generation { get }
}


