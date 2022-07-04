public struct MacBookAir: Decodable, DeviceType {
    public let generation: Generation
    public let aNumber: String
    public let fccID: String
    public let internalName: String
    public let identifier: Identifier
    public let color: String
    public let storage: String
    public let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case fccID = "FCC ID"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case color = "Color"
        case storage = "Storage"
        case model = "Model"
    }
}
