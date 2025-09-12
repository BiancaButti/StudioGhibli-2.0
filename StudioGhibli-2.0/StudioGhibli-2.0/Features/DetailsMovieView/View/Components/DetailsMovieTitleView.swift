import SwiftUI

struct DetailsMovieTitleView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.custom("Ghibli", size: 24))
            .fontWeight(.heavy)
            .foregroundStyle(
                LinearGradient(
                    colors: [Color.black, Color.black],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .shadow(color: .black.opacity(0.7),
                    radius: 4, x: 2, y: 2)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
            .padding(.top, 12)
    }
}

