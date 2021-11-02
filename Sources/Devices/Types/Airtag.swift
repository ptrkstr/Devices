public struct Airtag: Decodable {
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
