//
//  CustomVideoPlayer.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/14/22.
//

import SwiftUI
import AVKit
import HCVimeoVideoExtractor

struct CustomVideoPlayer: View {
    @StateObject private var customVideoPlayerViewModel: CustomVideoPlayerViewModel = .init()
    
    let link: String
    
    var body: some View {
        VideoPlayer(player: customVideoPlayerViewModel.player)
            .ignoresSafeArea()
            .unlockRotation()
            .onAppear {
                customVideoPlayerViewModel.playVideoWithLink(link)
            }
    }
}

struct CustomVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        CustomVideoPlayer(link: "")
    }
}
