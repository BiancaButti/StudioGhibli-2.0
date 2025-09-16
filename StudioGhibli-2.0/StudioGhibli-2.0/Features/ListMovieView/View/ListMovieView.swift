import SwiftUI

struct ListMovieView: View {
    @StateObject
    private var viewModel = ListMovieViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            case .loading:
                ProgressView()
            case .success( _):
                ListMovieGridView(viewModel: viewModel)
            case .failure( _):
                EmptyStateView {
                    fetchMovies()
                }
            }
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
    
    private func fetchMovies() {
        print("Tentar de novo clicado!")
    }
}
