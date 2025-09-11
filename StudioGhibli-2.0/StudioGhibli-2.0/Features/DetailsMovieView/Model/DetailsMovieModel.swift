import SwiftUI

struct DetailsMovieModel {
    let id = UUID()
    let bannerURL: URL?
    let title: String
    let description: String
    let producer: String
    let releaseDate: Date
    let durationMinutes: Int
}

extension DetailsMovieModel {
    var formattedReleaseDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateStyle = .long
        return formatter.string(from: releaseDate)
    }
    
    var formattedDuration: String {
        let hours = durationMinutes / 60
        let minutes = durationMinutes % 60
        switch (hours, minutes) {
        case (0, let m): return "\(m)m"
        case (let h, 0): return "\(h)h"
        default: return "\(hours)h \(minutes)m"
        }
    }
}
