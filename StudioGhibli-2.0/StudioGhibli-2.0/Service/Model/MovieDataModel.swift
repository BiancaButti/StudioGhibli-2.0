import Foundation

struct MovieViewData: Decodable, Identifiable {
    let id: String
    let title: String
    let originalTitle: String
    let imageURL: URL?
    let description: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let rating: String
    let people: [String]
    
    init(from apiModel: MovieAPIModel) {
        self.id = apiModel.id ?? UUID().uuidString
        self.title = apiModel.title ?? "Unknown Title"
        self.originalTitle = apiModel.originalTitle ?? ""
        self.imageURL = apiModel.image.flatMap { URL(string: $0) }
        self.description = apiModel.description ?? ""
        self.producer = apiModel.producer ?? "Unknown"
        self.releaseDate = apiModel.releaseDate ?? "-"
        self.runningTime = apiModel.runningTime ?? "0"
        self.rating = apiModel.ratingScore ?? "-"
        self.people = apiModel.people ?? []
    }
}
