import SwiftUI

struct DetailsMovieDescriptionView: View {
    let description: String
    
    var body: some View {
        Text(description)
            .font(.custom("Ghibli", size: 16))
            .lineSpacing(6)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 2)
    }
}

