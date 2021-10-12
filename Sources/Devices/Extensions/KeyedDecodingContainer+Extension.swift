extension KeyedDecodingContainer where Key : CodingKey {
    
    func decode(_ key: KeyedDecodingContainer<K>.Key) throws -> String {
        try decode(String.self, forKey: key)
    }
}

