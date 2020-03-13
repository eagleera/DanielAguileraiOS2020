import Foundation
struct RestaurantElement: Codable {
    let id: Int?
    let homeName: String?
    let logoURL: String?
    let waitlist: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case homeName = "name"
        case logoURL = "logo_url"
        case waitlist
    }
}
