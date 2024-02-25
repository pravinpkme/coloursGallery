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
}
