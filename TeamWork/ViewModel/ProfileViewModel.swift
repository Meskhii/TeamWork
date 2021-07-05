//
//  ProfileViewModel.swift
//  TeamWork
//
//  Created by Ilia Tsikelashvili on 05.07.21.
//

import Foundation

struct ProfileViewModel {
    
    private var profile: FeedArticles
    
    init(profile: FeedArticles) {
        self.profile = profile
    }
    
    var author: String {
        profile.author ?? ""
    }

}
