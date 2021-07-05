//
//  ViewController.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit

class FirstViewController: BaseViewController {
    
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    private var viewModel: InfoViewModelProtocol?
    private var dataSource: InfoDataSource?
    private var apiManager: WelcomeManagerProtocol?
    var info = [InfoViewModel]()
    
    var skipPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skipBtn.layer.cornerRadius = 15
        collectionView.registerNib(class: InfoCell.self)
        configureViewModel()
    }
    
    
    
    private func configureViewModel() {
        apiManager = WelcomeManager()
        viewModel = InfosViewModel(with: apiManager!, navigationController: self.navigationController, pageControl: self.pageControl)
        dataSource = InfoDataSource(with: collectionView,
                                    viewModel: viewModel as! InfoViewModelProtocol)
        
        dataSource!.refresh()
    }
    
    @IBAction func skip(_ sender: Any) {
        skipPressed = true
        skipPressed = UserDefaults.standard.bool(forKey: "skipped")
        coordinator?.proceedToSecondVC()
       
        
    }
    
    
    @IBAction func next(_ sender: Any) {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
           let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
           let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        if nextItem.row < info.count {
               self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
    }
    }
}

