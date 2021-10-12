public struct MacBookAir {
    let generation: String
    let aNumber: String
    let fccID: String
    let internalName: String
    let identifier: String
    let color: String
    let storage: String
    let model: String
    
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

extension MacBookAir: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        generation = try container.decode(.generation)
        aNumber = try container.decode(.aNumber)
        fccID = try container.decode(.fccID)
        internalName = try container.decode(.internalName)
        identifier = try container.decode(.identifier)
        color = try container.decode(.color)
        storage = try container.decode(.storage)
        model = try container.decode(.model)
    }
}
