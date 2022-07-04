public struct SmartKeyboard: Decodable, DeviceType {
    public let generation: Generation
    public let aNumber: String
    public let internalName: String
    public let identifier: Identifier
    public let iPadCompatibility: String
    public let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case iPadCompatibility = "iPad Compatibility"
        case model = "Model"
    }
}
