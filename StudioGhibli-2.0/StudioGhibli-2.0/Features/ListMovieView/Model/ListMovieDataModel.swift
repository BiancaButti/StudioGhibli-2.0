import Foundation

struct ListMovieDataModel: Identifiable {
    let id: String
    let title: String
    let originalTitle: String
    let rating: String
    let imageURL: URL?
    let detailsMovie: [DetailMovieDataModel]
    
    init(from apiModel: MovieAPIModel) {
        self.id = apiModel.id ?? ""
        self.title = apiModel.title
        self.originalTitle = apiModel.original_title ?? ""
        self.rating = apiModel.rt_score ?? ""
        self.imageURL = apiModel.image.flatMap { URL(string: $0) }
        self.detailsMovie = [DetailMovieDataModel(from: apiModel)]
    }
}
