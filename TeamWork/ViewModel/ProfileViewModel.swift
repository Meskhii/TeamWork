//
//  ProfileViewModel.swift
//  TeamWork
//
//  Created by Ilia Tsikelashvili on 05.07.21.
//

import Foundation

struct ProfileViewModel {
    
    private var profile: FeedModel
    
    init(profile: FeedModel) {
        self.profile = profile
    }
    
    var author: String {
        profile.author ?? ""
    }
    
    var title: String {
        profile.title ?? ""
    }
    var time: String {
        profile.time ?? ""
    }
    var imageOrd: String {
        profile.imageUrl ?? ""
    }
    var imageProfile: String {
        profile.imageUrl ?? ""
    }

}
