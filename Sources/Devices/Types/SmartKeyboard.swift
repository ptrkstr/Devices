public struct SmartKeyboard: Decodable {
    public let generation: String
    public let aNumber: String
    public let internalName: String
    public let identifier: String
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
