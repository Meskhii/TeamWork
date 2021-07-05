//
//  ViewController.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit

class FirstViewController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    private var viewModel: InfoViewModelProtocol!
    private var dataSource: InfoDataSource!
    private var apiManager: WelcomeManagerProtocol!
    var i: Int = 0
    var skipPressed = false
    var isLoading: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skipBtn.layer.cornerRadius = 8
        nextBtn.layer.cornerRadius = 2
        collectionView.registerNib(class: InfoCell.self)
        configureViewModel()
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    private func configureViewModel() {
        apiManager = WelcomeManager()
        viewModel = InfosViewModel(with: apiManager!, navigationController: self.navigationController, pageControl: self.pageControl)
        dataSource = InfoDataSource(with: collectionView,
                                    viewModel: viewModel, pageControl: pageControl)
        
        dataSource.refresh()
    }
    
    @IBAction func skip(_ sender: Any) {
        coordinator?.proceedToSecondVC()
    }
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(x : contentOffset ,y : self.collectionView.contentOffset.y ,width : self.collectionView.frame.width,height : self.collectionView.frame.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
    
    @IBAction func next(_ sender: Any) {
        
        if i < InfoDataSource.itemsCount - 1 {
            i += 1
            let collectionBounds = self.collectionView.bounds
            let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x + collectionBounds.size.width))
            self.moveCollectionToFrame(contentOffset: contentOffset)
            
        } else {
            coordinator?.proceedToSecondVCwithNext()
        }
        
    }
}

