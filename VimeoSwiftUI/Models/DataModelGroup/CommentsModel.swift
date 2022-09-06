//
//  CommentsModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import Foundation

// MARK: - CommentsModel
struct CommentsModel: Codable, Equatable {
    internal init() {
        self.uri = ""
        self.total = 0
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let uri = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.uri) {
            self.uri = uri
        } else {
            self.uri = ""
        }
        
        if let total = try? keyedCodingContainer.decode(Int.self, forKey: CodingKeys.total) {
            self.total = total
        } else {
            self.total = 0
        }
    }
    
    let uri: String
    let total: Int
}
