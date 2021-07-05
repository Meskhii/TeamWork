//
//  InfoDataSource.swift
//  TeamWork
//
//  Created by AltaSoftware MacMINI on 7/5/21.
//

import UIKit

class InfoDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    private var collectionView: UICollectionView!
    private var viewModel: InfoViewModelProtocol!
    private var infoViewModel = [InfoViewModel]()
    private var pageControl : UIPageControl!
    
    init(with collectionView: UICollectionView, viewModel: InfoViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchInfo{ viewModels in
            self.infoViewModel.append(contentsOf: viewModels)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.deque(InfoCell.self, for: indexPath)
        cell.configure(with: infoViewModel[indexPath.row])
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                   let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
                   let index = scrollView.contentOffset.x / witdh
                   let roundedIndex = round(index)
                   self.pageControl?.currentPage = Int(roundedIndex)
               }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = infoViewModel.count

            pageControl.numberOfPages = count
            pageControl.isHidden = !(count > 1)

            return count
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}
