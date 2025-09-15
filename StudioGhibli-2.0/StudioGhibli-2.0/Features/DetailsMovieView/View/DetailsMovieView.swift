import SwiftUI

struct DetailsMovieView: View {
    let movieModel: ListMovieDataModel
    
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
                    
                    DetailsMovieTitleView(
                        title: movieModel.title,
                        originalTitle: movieModel.originalTitle)
                    ForEach(movieModel.detailsMovie) { detail in
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                DetailMovieMetadataRowView(
                                    label: "Producer",
                                    value: detail.producer)
                                Spacer()
                                DetailMovieMetadataRowView(
                                    label: "Release",
                                    value: detail.releaseDate)
                            }
                            HStack {
                                DetailMovieMetadataRowView(
                                    label: "Duration",
                                    value: "\(detail.runningTime) m")
                            }
                            DetailsMovieDescriptionView(
                                description: detail.description)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 24)
                    }
                }
            }
            DetailsMovieBackButtonView()
        }
        .ignoresSafeArea(edges: .top)
        .toolbar(.hidden, for: .navigationBar)
    }
}
