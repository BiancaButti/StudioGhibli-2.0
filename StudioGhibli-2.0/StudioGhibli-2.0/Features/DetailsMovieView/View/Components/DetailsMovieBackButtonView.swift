import SwiftUI

struct DetailsMovieBackButtonView: View {
    @Environment(\.dismiss)
    var dismiss
    
    var body: some View {
        Button(action: { dismiss() }) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.white)
                .padding(12)
                .background(Color.black.opacity(0.5))
                .clipShape(Circle())
        }
        .padding(.leading, 16)
        .padding(.top, 44)
        .zIndex(1)
    }
}
