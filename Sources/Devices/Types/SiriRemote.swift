public struct SiriRemote: Decodable {
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
