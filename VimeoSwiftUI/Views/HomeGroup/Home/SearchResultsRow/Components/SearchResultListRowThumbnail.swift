//
//  SearchResultListRowThumbnail.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/13/22.
//

import SwiftUI

struct SearchResultListRowThumbnail: View {
    let imageURL: String
    let duration: Int
    // to know the screen size:
    let size = UIScreen.main.bounds
    // to know that we are in light mode or dark mode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            if let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .cornerRadius(8)
                        .frame(width: size.width / 2.5, height: size.width / 4)
                } placeholder: {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.2))
                        .cornerRadius(8)
                        .overlay(
                            ProgressView()
                                .tint(.white)
                        )
                        .frame(width: size.width / 2.5, height: size.width / 4)
                }
            } else {
                Rectangle()
                    .fill(Color.secondary.opacity(0.2))
                    .cornerRadius(8)
                    .overlay(
                        Image(systemName: "eye.slash.circle")
                            .resizable()
                            .frame(width: size.width / 7, height: size.width / 7)
                            .foregroundColor(.secondary)
                    )
                    .frame(width: size.width / 2.5, height: size.width / 4)
            }
            if duration != 0 {
                Text(duration.toHoursAndMinutes)
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)
                    .padding(.trailing, 8)
                    .padding(.bottom, 8)
            }
        }
    }
}

struct SearchResultListRowThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultListRowThumbnail(imageURL: "", duration: 0)
            .previewLayout(.sizeThatFits)
        SearchResultListRowThumbnail(imageURL: "", duration: 0)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
