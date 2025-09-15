import Foundation

struct MovieAPIModel: Decodable {
    let id: String?
    let title: String
    let original_title: String?
    let original_title_romanised: String?
    let image: String?
    let movie_banner: String?
    let description: String?
    let director: String?
    let producer: String?
    let release_date: String?
    let running_time: String?
    let rt_score: String?
    let people: [String]?
    let species: [String]?
    let locations: [String]?
    let vehicles: [String]?
    let url: String?
}
