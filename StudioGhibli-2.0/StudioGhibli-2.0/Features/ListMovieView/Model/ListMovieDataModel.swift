import Foundation

struct DetailMovieDataModel: Identifiable {
    let id: String
    let title: String
    let description: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let rating: String
    let imageURL: URL?
    
    init(from apiModel: MovieAPIModel) {
        self.id = apiModel.id ?? ""
        self.title = apiModel.title
        self.description = apiModel.description ?? ""
        self.producer = apiModel.producer ?? ""
        self.releaseDate = apiModel.release_date ?? ""
        self.runningTime = apiModel.running_time ?? ""
        self.rating = apiModel.rt_score ?? ""
        self.imageURL = apiModel.image.flatMap { URL(string: $0) }
    }
}

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
