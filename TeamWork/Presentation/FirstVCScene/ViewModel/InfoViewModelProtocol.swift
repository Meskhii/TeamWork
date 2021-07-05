//
//  InfoViewModelProtocol.swift
//  TeamWork
//
//  Created by AltaSoftware MacMINI on 7/5/21.
//

import UIKit


protocol InfoViewModelProtocol: AnyObject {
    
    func fetchInfo(completion: @escaping (([InfoViewModel]) -> Void))
   func proceedToDetails(using infoViewModel: InfoViewModel)
    
    init(with apiManager: WelcomeManagerProtocol, navigationController: UINavigationController?, pageControl: UIPageControl)
}

final class InfosViewModel: InfoViewModelProtocol {
  
    private var apiManager: WelcomeManagerProtocol
    private var navigationController: UINavigationController?
    private var pageControl : UIPageControl
    
    init(with apiManager: WelcomeManagerProtocol, navigationController: UINavigationController?, pageControl: UIPageControl) {
        self.apiManager = apiManager
        self.navigationController = navigationController
        self.pageControl = pageControl
    }
    
    func fetchInfo(completion: @escaping (([InfoViewModel]) -> Void)) {
        apiManager.fetchInfo { result in
            switch result {
            case .success(let response):
                completion(response.map { InfoViewModel(infos: $0) })
                print(response)
            case .failure(let err):
                print(err)
            }

        }
    }
    
    func proceedToDetails(using infoViewModel: InfoViewModel) {
        let sb = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
