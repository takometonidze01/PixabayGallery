//
//  PixabayImage.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 20.08.22.
//

import Foundation

struct PixabayImage: Codable {
    let previewURL: String?
    let type: String?
    let tags: String?
    let imageSize: Int?
    let views: Int?
    let downloads: Int?
    let likes: Int?
    let comments: Int?
    let user: String?
    
}
