import SwiftUI

struct DetailsMovieView: View {
    let movieModel: MovieViewData
    
    @Environment(\.dismiss)
    private var dismiss
    
    @Namespace
    private var animation

    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ParallaxBannerView(
                        url: movieModel.imageURL,
                        animation: animation,
                        onBack: { dismiss() }
                    )
                    
                    DetailsMovieTitleView(title: movieModel.title)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            DetailMovieMetadataRowView(label: "Producer", value: movieModel.producer)
                            Spacer()
                            DetailMovieMetadataRowView(label: "Release", value: movieModel.releaseDate)
                        }
                        
                        HStack {
                            DetailMovieMetadataRowView(label: "Duration", value: movieModel.runningTime)
                        }
                        DetailsMovieDescriptionView(description: movieModel.description)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }
            DetailsMovieBackButtonView()
        }
        .ignoresSafeArea(edges: .top)
        .toolbar(.hidden, for: .navigationBar)
    }
}
