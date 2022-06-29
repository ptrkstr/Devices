public struct ApplePencil: Decodable {
    public let generation: String
    public let aNumber: String
    public let fccID: String
    public let internalName: String
    public let identifier: String
    public let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case fccID = "FCC ID"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case model = "Model"
    }
}
