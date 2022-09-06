//
//  MetadataModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import Foundation

// MARK: - MetadataModel
struct MetadataModel: Codable, Equatable {
    internal init() {
        self.connections = PurpleConnectionsModel()
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let connections = try? keyedCodingContainer.decode(PurpleConnectionsModel.self, forKey: CodingKeys.connections) {
            self.connections = connections
        } else {
            self.connections = PurpleConnectionsModel()
        }
    }
    
    let connections: PurpleConnectionsModel

    enum CodingKeys: String, CodingKey {
        case connections
    }
}
