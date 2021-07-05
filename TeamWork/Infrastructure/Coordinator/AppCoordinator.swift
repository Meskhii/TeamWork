//
//  AppCoordinator.swift
//  TeamWork
//
//  Created by Nana Jimsheleishvili on 05.07.21.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    // MARK: - Init
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        if UserDefaults.standard.bool(forKey: "skipped"){
            let vc = FirstViewController.instantiateFromStoryboard()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            window?.rootViewController = navigationController
        } else {
            let vc = ThirdViewController.instantiateFromStoryboard()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            window?.rootViewController = navigationController
        }
        window?.makeKeyAndVisible()
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func proceedToSecondVC() {
        UserDefaults.standard.setValue(true, forKey:"skipped")
        let vc = SecondViewController.instantiateFromStoryboard()
        vc.coordinator = self
        UIApplication.shared.windows.first?.rootViewController = vc
        //navigationController?.pushViewController(vc, animated: true)
    }
    
    func proceedToThirdVC(with feedModel: FeedModel, coordinator: CoordinatorProtocol) {
        let vc = ThirdViewController.instantiateFromStoryboard()
        vc.feedModel = feedModel
        vc.coordinator = coordinator
        navigationController?.pushViewController(vc, animated: true)
    }

    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
}
