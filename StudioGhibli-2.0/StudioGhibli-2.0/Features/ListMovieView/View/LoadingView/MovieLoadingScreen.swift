import SwiftUI
import Lottie

struct MovieLoadingScreen: View {
    @Environment(\.colorScheme)
    var colorScheme
    
    private let subtitles = [
        "Your movie is almost ready 🎬",
        "Get your popcorn ready 🍿",
        "Adjusting the projector 🎥",
        "Don’t leave your seat!",
        "Preparing the big screen ✨"
    ]
    
    private var randomSubtitle: String { subtitles.randomElement() ?? "Get your popcorn ready 🍿" }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: backgroundColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 36) {
                LottieView(name: "loading_movie", loopMode: .loop)
                    .frame(width: 200, height: 200)
                    .padding()
                    .background(
                        colorScheme == .dark ? Color.black : Color.white
                    )
                    .cornerRadius(20)

                
                Text(randomSubtitle)
                    .font(.headline.weight(.semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: accentColors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }

    private var backgroundColors: [Color] {
        colorScheme == .dark
        ? [Color(red: 0.05, green: 0.05, blue: 0.05),
            .black]
        : [Color(.systemGray6),
            .white]
    }
    
    private var accentColors: [Color] {
        colorScheme == .dark
        ? [.yellow, .blue]
        : [.pink, .purple]
    }
}

struct MovieLoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieLoadingScreen()
                .preferredColorScheme(.light)
            
            MovieLoadingScreen()
                .preferredColorScheme(.dark)
        }
    }
}

