public struct iPadAir {
    let generation: String
    let aNumber: String
    let bootrom: String
    let fccID: String
    let internalName: String
    let identifier: String
    let finish: String
    let storage: String
    let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case bootrom = "Bootrom"
        case fccID = "FCC ID"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case finish = "Finish"
        case storage = "Storage"
        case model = "Model"
    }
}

extension iPadAir: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        generation = try container.decode(.generation)
        aNumber = try container.decode(.aNumber)
        bootrom = try container.decode(.bootrom)
        fccID = try container.decode(.fccID)
        internalName = try container.decode(.internalName)
        identifier = try container.decode(.identifier)
        finish = try container.decode(.finish)
        storage = try container.decode(.storage)
        model = try container.decode(.model)
    }
}
