import SwiftUI

struct ListMovieRowView: View {
    let movie: ListMovieDataModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: movie.imageURL) { image in
                image.resizable()
                     .scaledToFill()
                     .frame(maxWidth: .infinity)
                     .aspectRatio(2/3, contentMode: .fit)
                     .clipped()
                     .cornerRadius(8)
            } placeholder: {
                Color.gray.opacity(0.3)
                     .aspectRatio(2/3, contentMode: .fit)
                     .cornerRadius(8)
            }

            Text(movie.title)
                .font(.headline)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
