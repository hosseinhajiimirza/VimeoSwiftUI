//
//  DataModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import Foundation

// MARK: - DataModel
struct DataElementsModel: Codable, Identifiable, Equatable {
    internal init() {
        self.uri = ""
        self.name = ""
        self.description = ""
        self.type = ""
        self.link = ""
        self.playerEmbedURL = ""
        self.duration = 0
        self.pictures = PicturesModel()
        self.metadata = MetadataModel()
    }
    
    // We can make these properties optional and show them in our views if it is not nill. but I decided to create custom init so there is no need to use optional binding or emplicity force unwrapping in my code.
    init(from decoder: Decoder) throws {
        // setting CondingKeys enum as a countaier for our decoder:
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let uri = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.uri) {
            self.uri = uri
        } else {
            self.uri = ""
        }
        
        if let name = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.name) {
            self.name = name
        } else {
            self.name = ""
        }
        
        if let description = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            self.description = ""
        }
        
        if let type = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.type) {
            self.type = type
        } else {
            self.type = ""
        }
        
        if let link = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.link) {
            self.link = link
        } else {
            self.link = ""
        }
        
        if let playerEmbedURL = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.playerEmbedURL) {
            self.playerEmbedURL = playerEmbedURL
        } else {
            self.playerEmbedURL = ""
        }
        
        if let duration = try? keyedCodingContainer.decode(Int.self, forKey: CodingKeys.duration) {
            self.duration = duration
        } else {
            self.duration = 0
        }
        
        if let pictures = try? keyedCodingContainer.decode(PicturesModel.self, forKey: CodingKeys.pictures) {
            self.pictures = pictures
        } else {
            self.pictures = PicturesModel()
        }
        
        if let metadata = try? keyedCodingContainer.decode(MetadataModel.self, forKey: CodingKeys.metadata) {
            self.metadata = metadata
        } else {
            self.metadata = MetadataModel()
        }
    }
    
    let uri, name, description, type: String
    let link, playerEmbedURL: String
    let duration: Int
    let pictures: PicturesModel
    let metadata: MetadataModel
    let id = UUID().uuidString

    enum CodingKeys: String, CodingKey {
        case uri, name
        case description
        case type
        case link
        case playerEmbedURL = "player_embed_url"
        case pictures
        case metadata
        case duration
    }
}

typealias DataModel = [DataElementsModel]
