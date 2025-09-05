import SwiftUI

@MainActor
class ListMovieViewModel: ObservableObject {
    @Published var state: TreatmentState<[MovieViewData]> = .idle
    
    private let service: APIService
    
    init(service: APIService = APIService()) {
        self.service = service
    }
    
    func fetchMovies() async {
        state = .loading
        
        do {
            let movies = try await service.fetchMovie()
            state = .success(movies)
        } catch {
            state = .failure(error)
        }
    }
}

enum TreatmentState<T> {
    case idle
    case loading
    case success(T)
    case failure(Error)
}
