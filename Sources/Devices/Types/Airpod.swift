public struct Airpod: Decodable, DeviceType {
    public let generation: Generation
    public let aNumber: String
    public let bootrom: String
    public let fccID: String
    public let internalName: String
    public let identifier: Identifier
    public let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case bootrom = "Bootrom"
        case fccID = "FCC ID"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case model = "Model"
    }
}
