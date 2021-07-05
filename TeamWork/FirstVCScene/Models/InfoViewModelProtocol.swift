//
//  InfoViewModelProtocol.swift
//  TeamWork
//
//  Created by AltaSoftware MacMINI on 7/5/21.
//

import Foundation


protocol InfoViewModelProtocol: AnyObject {
    func fetchInfo(completion: @escaping (([InfoViewModel]) -> Void))
   func proceedToDetails(using infoViewModel: InfoViewModel)
    
    init(with apiManager: APIManagerProtocol, navigationController: UINavigationController?)
}

final class InfosViewModel: InfoViewModelProtocol {
    
    private var apiManager: APIManagerProtocol
    private var navigationController: UINavigationController?
    
    init(with apiManager: APIManagerProtocol, navigationController: UINavigationController?) {
        self.apiManager = apiManager
        self.navigationController = navigationController
    }
    
    func fetchInfo(completion: @escaping (([InfoViewModel]) -> Void)) {
        apiManager.fetchInfo { info in
            completion(info.map { InfoViewModel(infos: $0) })
        }
    }
    
    func proceedToDetails(using newsViewModel: InfoViewModel) {
        let sb = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
