//
//  PicturesModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import Foundation

// MARK: - PicturesModel
struct PicturesModel: Codable, Equatable {
    internal init() {
        self.sizes = [SizeModel]()
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let sizes = try? keyedCodingContainer.decode([SizeModel].self, forKey: CodingKeys.sizes) {
            self.sizes = sizes
        } else {
            self.sizes = [SizeModel]()
        }
    }
    
    let sizes: [SizeModel]

    enum CodingKeys: String, CodingKey {
        case sizes
    }
}
