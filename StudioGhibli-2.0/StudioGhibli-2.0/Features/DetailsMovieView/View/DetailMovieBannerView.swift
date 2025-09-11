import SwiftUI

struct DetailMovieBannerView: View {
    let url: URL?
    let title: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(height: 220)
            .clipped()
            
            LinearGradient(
                gradient: Gradient(colors: [.clear, Color.black.opacity(0.6)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 100) // altura só no rodapé
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
            Text(title)
                .font(.title2).bold()
                .foregroundColor(.white)
                .padding()
        }

    }
}
