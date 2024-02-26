//
//  PhotoModerl.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 24/02/24.
//

import Foundation

struct PhotoModel: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        albumId = try container.decode(Int.self, forKey: .albumId)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
        thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
    }
}
