//
//  MainModel.swift
//  VimeoSwiftUI
//
//  Created by Hossein Hajimirza on 8/12/22.
//

import Foundation

// MARK: - MainModel
struct MainModel: Codable {
    let total, page, perPage: Int
    let paging: PagingModel
    let data: DataModel

    enum CodingKeys: String, CodingKey {
        case total, page
        case perPage = "per_page"
        case paging, data
    }
}
