import Foundation

class APIService {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchMovies() async throws -> [MovieViewData] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films/") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let apiMovies = try decoder.decode([MovieAPIModel].self, from: data)
        return apiMovies.map { MovieViewData(from: $0) }
    }
}
