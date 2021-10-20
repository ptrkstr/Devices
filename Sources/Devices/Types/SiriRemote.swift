public struct SiriRemote {
    let generation: String
    let aNumber: String
    let fccID: String
    let internalName: String
    let identifier: String
    let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case fccID = "FCC ID"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case model = "Model"
    }
}

extension SiriRemote: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        generation = try container.decode(.generation)
        aNumber = try container.decode(.aNumber)
        fccID = try container.decode(.fccID)
        internalName = try container.decode(.internalName)
        identifier = try container.decode(.identifier)
        model = try container.decode(.model)
    }
}

