import SwiftUI
import Lottie

struct EmptyStateView: View {
    var retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            LottieView(name: "empty_state_ghost", loopMode: .loop)
                .frame(width: 200, height: 200)
            
            Text("Movie not found")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Try to search for another title of Studio Ghibli.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                retryAction()
            }) {
                Text("Try again")
                    .font(.headline)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(
                        LinearGradient(colors: [Color.purple.opacity(0.7), Color.blue.opacity(0.7)], startPoint: .leading, endPoint: .trailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
        .padding()
    }
}

//struct EmptyStatePreview_Previews: PreviewProvider {
//    static var previews: some View {
//        EmptyStateView(retryAction: {})
//    }
//}
