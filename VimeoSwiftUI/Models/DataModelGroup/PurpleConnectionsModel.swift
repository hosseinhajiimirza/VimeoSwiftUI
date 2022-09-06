//
//  PurpleConnectionsModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import Foundation

// MARK: - PurpleConnectionsModel
struct PurpleConnectionsModel: Codable, Equatable {
    internal init() {
        self.comments = CommentsModel()
        self.credits = CommentsModel()
        self.likes = CommentsModel()
        self.pictures = CommentsModel()
        self.texttracks = CommentsModel()
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let comments = try? keyedCodingContainer.decode(CommentsModel.self, forKey: CodingKeys.comments) {
            self.comments = comments
        } else {
            self.comments = CommentsModel()
        }
        
        if let credits = try? keyedCodingContainer.decode(CommentsModel.self, forKey: CodingKeys.credits) {
            self.credits = credits
        } else {
            self.credits = CommentsModel()
        }
        
        if let likes = try? keyedCodingContainer.decode(CommentsModel.self, forKey: CodingKeys.likes) {
            self.likes = likes
        } else {
            self.likes = CommentsModel()
        }
        
        if let pictures = try? keyedCodingContainer.decode(CommentsModel.self, forKey: CodingKeys.pictures) {
            self.pictures = pictures
        } else {
            self.pictures = CommentsModel()
        }
        
        if let texttracks = try? keyedCodingContainer.decode(CommentsModel.self, forKey: CodingKeys.texttracks) {
            self.texttracks = texttracks
        } else {
            self.texttracks = CommentsModel()
        }
    }
    
    let comments, credits, likes, pictures: CommentsModel
    let texttracks: CommentsModel
    
    enum CodingKeys: String, CodingKey {
        case comments, credits, likes, pictures
        case texttracks
    }
}
