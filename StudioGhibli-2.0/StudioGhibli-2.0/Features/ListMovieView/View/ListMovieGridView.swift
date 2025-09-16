import SwiftUI

struct ListMovieGridView: View {
    @ObservedObject
    var viewModel: ListMovieViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.filteredMovies) { movie in
                        NavigationLink(
                            destination: DetailsMovieView(movie: movie)
                        ) {
                            ListMovieRowView(movie: movie)
                                .foregroundColor(.primary)
                        }
                        .buttonStyle(.automatic)
                    }
                }
                .padding(16)
            }
            .navigationTitle("Studio Ghibli Works")
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: "Find a movie"
            )
        }
    }
}

