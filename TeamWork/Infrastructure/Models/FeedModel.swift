//
//  FeedModel.swift
//  TeamWork
//
//  Created by Nana Jimsheleishvili on 05.07.21.
//

import Foundation

struct FeedModel: Codable {
    let title: String?
    let author: String?
    let imageUrl: String?
    let description: String?
    let time: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case author = "author"
        case imageUrl = "urlToImage"
        case description = "description"
        case time = "publishedAt"
    }
}
