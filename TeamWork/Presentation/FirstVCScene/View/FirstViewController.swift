//
//  ViewController.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    private var viewModel: InfoViewModelProtocol!
    private var dataSource: InfoDataSource!
    private var apiManager: APIManagerProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        skipBtn.layer.cornerRadius = 15
        collectionView.registerNib(class: InfoCell.self)
   
    configureViewModel()
}

private func configureViewModel() {
    apiManager = APIManager()
    viewModel = InfoViewModelProtocol(with: apiManager,
                                  navigationController: self.navigationController)
    dataSource = InfoDataSource(with: collectionView,
                                viewModel: viewModel)
    
    dataSource.refresh()
}
    @IBAction func skip(_ sender: Any) {
        let sb = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    @IBAction func next(_ sender: Any) {
        let sb = UIStoryboard(name: "SecondViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

