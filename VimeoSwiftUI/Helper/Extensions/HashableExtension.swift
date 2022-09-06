//
//  HashableExtension.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import UIKit
import AVKit

// MARK: - String extension
extension String {
    // We have access to the Thumbnail in the response, but if we wanted to create a thumbnail from a video URL, we could use something like this:
    /// it returns an UIImageView from a video URL.
    public func getThumbnailImageView() -> UIImageView? {
        // creating URL:
        guard let url = URL(string: self) else { return nil }
        // creating AVAsset:
        let asset = AVAsset(url: url)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        // choosing the time:
        let time = CMTimeMakeWithSeconds(0.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            
            return UIImageView(image: thumbnail)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

// MARK: - Int extension
extension Int {
    /// creates a "hh:mm" format
    var toHoursAndMinutes: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute]
        
        let remaining: TimeInterval = TimeInterval(self * 60)
        
        guard let str = formatter.string(from: remaining) else { return "" }
        
        return str
    }
}
