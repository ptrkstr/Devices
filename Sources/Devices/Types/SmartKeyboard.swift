public struct SmartKeyboard {
    let generation: String
    let aNumber: String
    let internalName: String
    let identifier: String
    let iPadCompatibility: String
    let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case iPadCompatibility = "iPad Compatibility"
        case model = "Model"
    }
}

extension SmartKeyboard: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        generation = try container.decode(.generation)
        aNumber = try container.decode(.aNumber)
        internalName = try container.decode(.internalName)
        identifier = try container.decode(.identifier)
        iPadCompatibility = try container.decode(.iPadCompatibility)
        model = try container.decode(.model)
    }
}

