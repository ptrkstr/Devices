public struct SmartKeyboard: Decodable {
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
