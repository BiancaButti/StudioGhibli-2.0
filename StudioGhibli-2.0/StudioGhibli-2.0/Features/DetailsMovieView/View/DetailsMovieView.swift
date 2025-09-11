import SwiftUI

struct DetailsMovieView: View {
    let movieModel: MovieViewData
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ParallaxBannerView(
                    url: movieModel.imageURL,
                    title: movieModel.title,
                    onBack: { dismiss() }
                )
                
                VStack(alignment: .leading, spacing: 20) {
                    DetailsMovieDescriptionView(description: movieModel.description)
                    
                    HStack {
                        DetailMovieMetadataRowView(label: "Producer", value: movieModel.producer)
                        Spacer()
                        DetailMovieMetadataRowView(label: "Release", value: movieModel.releaseDate)
                    }
                    
                    HStack {
                        DetailMovieMetadataRowView(label: "Duration", value: movieModel.runningTime)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
            }
        }
        .ignoresSafeArea(edges: .top)
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Banner com Parallax
struct ParallaxBannerView: View {
    let url: URL?
    let title: String
    let onBack: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            let offset = geo.frame(in: .global).minY
            
            ZStack(alignment: .topLeading) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geo.size.width,
                            height: offset > 0 ? 220 + offset : 220
                        )
                        .clipped()
                        .offset(y: offset > 0 ? -offset : 0)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.6), .clear]),
                    startPoint: .top,
                    endPoint: .center
                )
                
                Button(action: onBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.black.opacity(0.5))
                        .clipShape(Circle())
                }
                .padding(.leading, 16)
                .padding(.top, 44)
                
                VStack {
                    Spacer()
                    Text(title)
                        .font(.title2).bold()
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
        .frame(height: 220) 
    }
}
