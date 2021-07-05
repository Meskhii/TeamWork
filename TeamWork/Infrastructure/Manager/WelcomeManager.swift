//
//  WelcomeManager.swift
//  TeamWork
//
//  Created by Nana Jimsheleishvili on 05.07.21.
//

import Foundation

import Foundation

protocol WelcomeManagerProtocol: AnyObject {
    func fetchInfo(completion: @escaping ((Result<[WelcomeModel], Error>) -> Void))
}

class WelcomeManager: WelcomeManagerProtocol {
    func fetchInfo(completion: @escaping ((Result<[WelcomeModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/3c597760-1ebc-4136-a10f-d285c3343efb"
        NetworkManager.shared.get(url: url) { (result: Result<[WelcomeModel], Error>) in
            switch result {
            case .success(let welcomeModel):
                completion(.success(welcomeModel))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}

