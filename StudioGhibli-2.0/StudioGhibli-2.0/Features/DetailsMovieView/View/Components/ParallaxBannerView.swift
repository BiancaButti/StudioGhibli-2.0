import SwiftUI

struct ParallaxBannerView: View {
    let url: URL?
    var animation: Namespace.ID
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
                        .matchedGeometryEffect(id: 002, in: animation)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
            }
        }
        .frame(height: 220)
    }
}

