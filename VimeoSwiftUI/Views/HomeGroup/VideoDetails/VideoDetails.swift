//
//  VideoDetails.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/14/22.
//

import SwiftUI
import AVKit

struct VideoDetails: View {
    @State private var isVideoPlayerPresented: Bool = false
    
    let dataElementsModel: DataElementsModel
    // to know the screen size:
    let size = UIScreen.main.bounds
    // to dismiss the view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(dataElementsModel.name)
                        .font(.title2)
                        .padding(.top, 32)
                    ZStack {
                        if dataElementsModel.pictures.sizes.count > 2 {
                            VideoDetailsThumbnail(thumbnailLink: dataElementsModel.pictures.sizes[3].link, duration: dataElementsModel.duration)
                        }
                        Button {
                            isVideoPlayerPresented = true
                        } label: {
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .foregroundColor(.secondary)
                                .frame(width: size.width / 6, height: size.width / 6)
                        }
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                    }
                    .frame(maxWidth: .infinity)
                    HStack(alignment: .top) {
                        Spacer()
                        VideoDetailsButton(sfSymbol: "eye.fill", totalCount: dataElementsModel.metadata.connections.credits.total)
                        Spacer()
                        Spacer()
                        VideoDetailsButton(sfSymbol: "heart", totalCount: dataElementsModel.metadata.connections.likes.total)
                        Spacer()
                        Spacer()
                        VideoDetailsButton(sfSymbol: "bubble.left", totalCount: dataElementsModel.metadata.connections.comments.total)
                        Spacer()
                    }
                    Divider()
                        .padding(.leading)
                    Text(dataElementsModel.description)
                }
            }
            
            Button {
                withAnimation {
                    dismiss()
                }
            } label: {
                Image(systemName: "multiply")
                    .imageScale(.large)
                    .foregroundColor(.secondary)
                    .padding(12)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $isVideoPlayerPresented) {
            CustomVideoPlayer(link: dataElementsModel.link)
        }
    }
}

struct VideoDetails_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetails(dataElementsModel: DataElementsModel())
    }
}
