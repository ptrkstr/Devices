public struct Airtag {
    let generation: String
    let aNumber: String
    let bootrom: String
    let fccID: String
    let internalName: String
    let identifier: String
    let packSize: String
    let model: String
    
    enum CodingKeys: String, CodingKey {
        case generation = "Generation"
        case aNumber = "\"A\" Number"
        case bootrom = "Bootrom"
        case fccID = "FCC ID"
        case internalName = "Internal Name"
        case identifier = "Identifier"
        case packSize = "Pack Size"
        case model = "Model"
    }
}

extension Airtag: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        generation = try container.decode(.generation)
        aNumber = try container.decode(.aNumber)
        bootrom = try container.decode(.bootrom)
        fccID = try container.decode(.fccID)
        internalName = try container.decode(.internalName)
        identifier = try container.decode(.identifier)
        packSize = try container.decode(.packSize)
        model = try container.decode(.model)
    }
}
