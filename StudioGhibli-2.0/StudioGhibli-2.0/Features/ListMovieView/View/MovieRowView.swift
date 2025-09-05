import SwiftUI

struct MovieRowView: View {
    @Binding var isFavorite: Bool
    let movie: MovieViewData
    
    var body: some View {
        HStack {
            AsyncImage(url: movie.imageURL) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 80, height: 120)
            .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.originalTitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
