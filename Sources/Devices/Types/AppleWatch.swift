public struct AppleWatch: Decodable, DeviceType {
    public let generation: Generation
    public let aNumber: String
    public let bootrom: String
    public let fccID: String
    public let internalName: String
    public let identifier: Identifier
    public let caseMaterial: String
    public let finish: String
    public let caseSize: String
    public let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case bootrom = "Bootrom"
        case fccID = "FCC ID"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case caseMaterial = "Case Material"
        case finish = "Finish"
        case caseSize = "Case Size"
        case model = "Model"
    }
}
