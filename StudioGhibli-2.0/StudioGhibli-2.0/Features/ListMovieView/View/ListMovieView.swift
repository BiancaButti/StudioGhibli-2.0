import SwiftUI

struct ListMovieView: View {
    @StateObject private var viewModel = ListMovieViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .success(_):
                NavigationStack {
                    List(viewModel.state.value ?? []) { movie in
                        ListMovieRowView(movie: movie)
                    }
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
