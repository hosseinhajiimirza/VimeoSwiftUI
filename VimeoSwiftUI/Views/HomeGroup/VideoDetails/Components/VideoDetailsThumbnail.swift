//
//  VideoDetailsThumbnail.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/14/22.
//

import SwiftUI

struct VideoDetailsThumbnail: View {
    let thumbnailLink: String
    let duration: Int
    // to know the screen size:
    let size = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            if let url = URL(string: thumbnailLink) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .cornerRadius(8)
                        .frame(height: size.height / 3.5)
                } placeholder: {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.2))
                        .cornerRadius(8)
                        .overlay(
                            ProgressView()
                                .tint(.white)
                        )
                        .frame(height: size.height / 3.5)
                }
            }
            if duration != 0 {
                Text(duration.toHoursAndMinutes)
                    .font(.body)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)
                    .padding(.trailing, 12)
                    .padding(.bottom, 12)
            }
        }
    }
}

struct VideoDetailsThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsThumbnail(thumbnailLink: "h", duration: 110)
    }
}
