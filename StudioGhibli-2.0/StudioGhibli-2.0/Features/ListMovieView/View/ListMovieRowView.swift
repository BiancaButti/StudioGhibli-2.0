import SwiftUI

struct ListMovieRowView: View {
    let movie: ListMovieDataModel
    
    var body: some View {
        HStack {
            AsyncImage(url: movie.imageURL) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 80, height: 120)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)
                    .layoutPriority(1)
            }
            Spacer()
            NavigationLink {
                DetailsMovieView(movieModel: movie)
            } label: {
                Text("")
            }
        }
        .padding()
    }
}
