public struct Airpod {
    let generation: String
    let aNumber: String
    let bootrom: String
    let fccID: String
    let internalName: String
    let identifier: String
    let model: String
    
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

extension Airpod: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        generation = try container.decode(.generation)
        aNumber = try container.decode(.aNumber)
        bootrom = try container.decode(.bootrom)
        fccID = try container.decode(.fccID)
        internalName = try container.decode(.internalName)
        identifier = try container.decode(.identifier)
        model = try container.decode(.model)
    }
}

extension KeyedDecodingContainer where Key : CodingKey {
    
    // TODO: If T is [String], split
    // TODO: if T is string, validate that there is no new line
    
    func decode(_ key: KeyedDecodingContainer<K>.Key) throws -> String {
        try decode(String.self, forKey: key)
    }
}

extension String {
    func splitNewline() -> [String] {
        components(separatedBy: "\n")
    }
    
    func splitComma() -> [String] {
        components(separatedBy: ", ")
    }
}
