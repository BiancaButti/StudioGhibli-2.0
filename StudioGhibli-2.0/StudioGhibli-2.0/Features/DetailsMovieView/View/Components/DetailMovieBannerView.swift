import SwiftUI

struct DetailMovieBannerView: View {
    let url: URL?

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { geo in
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width * 0.5)
                        .clipped()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
            }
            .frame(height: UIScreen.main.bounds.width * 0.5)
            
            LinearGradient(
                gradient: Gradient(colors: [.clear, Color.black.opacity(0.6)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 100)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }

    }
}
