import Foundation

class APIService {
    
    func fetchMovie() async throws -> [MovieViewData] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films/") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([MovieViewData].self, from: data)
    }
}
