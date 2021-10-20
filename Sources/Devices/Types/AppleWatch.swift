public struct AppleWatch {
    let generation: String
    let aNumber: String
    let bootrom: String
    let fccID: String
    let internalName: String
    let identifier: String
    let caseMaterial: String
    let finish: String
    let caseSize: String
    let model: String
    
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

extension AppleWatch: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        generation = try container.decode(.generation)
        aNumber = try container.decode(.aNumber)
        bootrom = try container.decode(.bootrom)
        fccID = try container.decode(.fccID)
        internalName = try container.decode(.internalName)
        identifier = try container.decode(.identifier)
        caseMaterial = try container.decode(.caseMaterial)
        finish = try container.decode(.finish)
        caseSize = try container.decode(.caseSize)
        model = try container.decode(.model)
    }
}
