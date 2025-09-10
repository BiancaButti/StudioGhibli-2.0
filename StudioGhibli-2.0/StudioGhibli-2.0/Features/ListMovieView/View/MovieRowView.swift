import SwiftUI

struct MovieRowView: View {
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
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)
                    .layoutPriority(1)
            }
            Spacer()
            Button {
                print("clicked button")
            } label: {
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .padding()

    }
}
