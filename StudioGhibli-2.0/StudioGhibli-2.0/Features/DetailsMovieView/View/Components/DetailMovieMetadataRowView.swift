import SwiftUI

struct DetailMovieMetadataRowView: View {
    let label: String
    let value: String
    var alignment: HorizontalAlignment = .leading
    
    var body: some View {
        VStack(alignment: alignment, spacing: 2) {
            Text(label.uppercased())
                .font(.caption2)
                .foregroundColor(.gray.opacity(0.7))
            
            Text(value)
                .font(.subheadline)
                .bold()
                .foregroundStyle(LinearGradient(
                    colors: [Color.black, Color.black],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .shadow(color: .black.opacity(0.4), radius: 1, x: 0, y: 1)
        }
    }
}
