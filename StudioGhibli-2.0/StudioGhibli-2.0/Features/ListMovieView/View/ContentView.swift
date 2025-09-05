import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ListMovieViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                Text("No movie loaded")
            case .loading:
                ProgressView()
            case .success(let movies):
                List(movies, id: \.id) { movie in
                    Text(movie.title ?? "")
                }
            case .failure(let error):
                Text("Erro: \(error.localizedDescription)")
            }
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

