//
//  CustomVideoPlayerViewModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/14/22.
//

import SwiftUI
import AVKit
import HCVimeoVideoExtractor

final class CustomVideoPlayerViewModel: ObservableObject {
    @Published public var player: AVPlayer = .init()

    public func playVideoWithLink(_ link: String) {
        guard let url = URL(string: link) else { return }
        HCVimeoVideoExtractor.fetchVideoURLFrom(url: url, completion: { (video: HCVimeoVideo?, error: Error?) -> Void in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let vid = video else {
                    print("Invalid video object")
                    return
                }
                if let videoURL = vid.videoURL[.quality360p] {
                    self.player = AVPlayer(url: videoURL)
                    self.player.play()
                }
            }
        })
    }
}
