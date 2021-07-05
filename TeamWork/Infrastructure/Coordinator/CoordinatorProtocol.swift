//
//  CoordinatorProtocol.swift
//  TeamWork
//
//  Created by Nana Jimsheleishvili on 05.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func popViewController()
    func proceedToSecondVC()
    func proceedToThirdVC(with feed: FeedModel, coordinator: CoordinatorProtocol)
    func showAlert(message: String)
}
