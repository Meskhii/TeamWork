//
//  FeedManager.swift
//  TeamWork
//
//  Created by Nana Jimsheleishvili on 05.07.21.
//

import Foundation

protocol FeedManagerProtocol: AnyObject {
    func fetchFeedList(completion: @escaping ((Result<[FeedModel], Error>) -> Void))
}

class FeedManager: FeedManagerProtocol {
    func fetchFeedList(completion: @escaping ((Result<[FeedModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/ab4f4c60-daf3-4e43-8148-8065d1178315"
        NetworkManager.shared.get(url: url) { (result: Result<FeedArticles, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.articles))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
