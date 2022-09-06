//
//  PagingModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import Foundation

// MARK: - PagingModel
struct PagingModel: Codable {
    let next, previous: String?
    let first, last: String
}
