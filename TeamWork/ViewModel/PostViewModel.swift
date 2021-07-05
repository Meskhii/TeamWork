//
//  PostViewModel.swift
//  TeamWork
//
//  Created by Ilia Tsikelashvili on 05.07.21.
//

import Foundation
import UIKit

protocol PostViewModelProtocol: AnyObject {
    
    func getCountriesList(completion: @escaping (([ProfileViewModel]) -> Void))
    var didFinishedLoading: (() -> Void)? { get set }
    var spinner: UIActivityIndicatorView? { get set }
    var navigationItem: UINavigationItem? { get set }
    
    init(with profilesManager: ProfileManagerProtocol)
}

class PostViewModel: PostViewModelProtocol {
    
    // MARK: - Private properties
    
    private var countriesManager: ProfileManagerProtocol!
    
    // MARK: - Outputs
    
    var didFinishedLoading: (() -> Void)?
    
    // MARK: - Internal properties
    
    var spinner: UIActivityIndicatorView?
    var navigationItem: UINavigationItem?
    
    required init(with profilesManager: ProfileManagerProtocol)  {
        self.profilesManager = profilesManager
    }
    
    func getCountriesList(completion: @escaping (([ProfileViewModel]) -> Void)) {
        profilesManager.fetchProfiles { profiles in
            DispatchQueue.main.async {
                
                let profileViewModels =  profiles.map { ProfileViewModel(profile: $0) }
            
                completion(profileViewModels)
            }
        }
    }
    
    func setTitle(with text: String, on navigationItem: UINavigationItem) {
        navigationItem.title = text
    }
}
