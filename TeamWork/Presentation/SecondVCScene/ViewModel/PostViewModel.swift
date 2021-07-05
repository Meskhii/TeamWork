//
//  PostViewModel.swift
//  TeamWork
//
//  Created by Ilia Tsikelashvili on 05.07.21.
//

import Foundation
import UIKit

protocol PostViewModelProtocol: AnyObject {
    
    func getArticles(completion: @escaping((Result<[FeedModel], Error>) -> Void))
    var didFinishedLoading: (() -> Void)? { get set }
    var spinner: UIActivityIndicatorView? { get set }
    var navigationItem: UINavigationItem? { get set }
    
    init(with profilesManager: FeedManagerProtocol)
}

class PostViewModel: PostViewModelProtocol {
    
    // MARK: - Private properties
    
    private var profilesManager: FeedManagerProtocol!
    
    
    // MARK: - Outputs
    
    var didFinishedLoading: (() -> Void)?
    
    // MARK: - Internal properties
    
    var spinner: UIActivityIndicatorView?
    var navigationItem: UINavigationItem?
    
    required init(with profilesManager: FeedManagerProtocol)  {
        self.profilesManager = profilesManager
    }
    
    func getArticles(completion: @escaping((Result<[FeedModel], Error>) -> Void)) {
        profilesManager.fetchFeedList(completion: completion)
    }
    
    func setTitle(with text: String, on navigationItem: UINavigationItem) {
        navigationItem.title = text
    }
}
