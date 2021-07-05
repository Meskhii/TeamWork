//
//  Info.swift
//  TeamWork
//
//  Created by AltaSoftware MacMINI on 7/5/21.
//

import Foundation

struct Info: Codable {
    var imageUrl: String!
    var text: String!

    
enum CodingKeys: String, CodingKey {
    case text
    case imageUrl = "image_url"
  
}
}
