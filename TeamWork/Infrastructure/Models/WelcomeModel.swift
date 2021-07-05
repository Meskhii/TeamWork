//
//  WelcomeModel.swift
//  TeamWork
//
//  Created by Nana Jimsheleishvili on 05.07.21.
//

import Foundation

struct WelcomeModel: Codable {
    let text: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case imageUrl = "image_url"
    }
}
