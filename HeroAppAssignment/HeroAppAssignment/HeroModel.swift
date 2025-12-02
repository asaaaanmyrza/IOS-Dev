struct HeroModel: Decodable {
    let id: Int
    let name: String
    let images: HeroImage
    let powerstats: HeroPowerStats
    let biography: HeroBiography
    
    struct HeroBiography: Decodable {
        let fullName: String
        let placeOfBirth: String
    }

    struct HeroImage: Decodable {
        let md: String
    }
    
    struct HeroPowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
}
