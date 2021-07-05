//
//  InfoViewModel.swift
//  TeamWork
//
//  Created by AltaSoftware MacMINI on 7/5/21.
//

import Foundation


struct InfoViewModel {
    
    private var infos: Info
    
    init(infos: Info) {
        self.infos = infos
        
    }
    
    var imageUrl: URL? {
        URL(string: infos.imageUrl ?? "")
    }
    
    var text: String {
        infos.text ?? ""
    }
}
