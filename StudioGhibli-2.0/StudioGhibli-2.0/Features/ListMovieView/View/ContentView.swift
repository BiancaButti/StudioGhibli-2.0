import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ListMovieViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .success( _):
                List(viewModel.state.value ?? []) { movie in
                    MovieRowView(movie: movie)
                }
            case .failure(let error):
                Text("Erro: \(error)")
            }
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

