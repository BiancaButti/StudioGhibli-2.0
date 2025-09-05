import SwiftUI

@MainActor
class ListMovieViewModel: ObservableObject {
    @Published var state: ViewState<[MovieViewData]> = .idle
    
    private let service: APIService
    
    init(service: APIService = APIService()) {
        self.service = service
    }
    
    func fetchMovies() async {
        state = .loading
        await loadMovies()
    }
    
    private func loadMovies() async {
        do {
            let movies = try await service.fetchMovies()
            state = .success(movies)
        } catch {
            state = .failure(error.localizedDescription)
        }
    }
}

enum ViewState<T> {
    case idle
    case loading
    case success(T)
    case failure(String)
    
    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
    
    var value: T? {
        if case .success(let data) = self { return data }
        return nil
    }
    
    var errorMessage: String? {
        if case .failure(let message) = self { return message }
        return nil
    }
}
