//
//  SizeModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import Foundation

// MARK: - SizeModel
struct SizeModel: Codable, Equatable {
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let link = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.link) {
            self.link = link
        } else {
            self.link = ""
        }
        
        if let linkWithPlayButton = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.linkWithPlayButton) {
            self.linkWithPlayButton = linkWithPlayButton
        } else {
            self.linkWithPlayButton = ""
        }
    }

    let link: String
    let linkWithPlayButton: String

    enum CodingKeys: String, CodingKey {
        case link
        case linkWithPlayButton = "link_with_play_button"
    }
}
