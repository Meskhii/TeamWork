//
//  PostDataSource.swift
//  TeamWork
//
//  Created by Ilia Tsikelashvili on 05.07.21.
//

import UIKit

class PostDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var viewModel: PostViewModelProtocol!
    
    private var postList = [FeedModel]()
    
    init(with tableView: UITableView, viewModel: PostViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.getArticles { [weak self] result in
            switch result {
            case .success(let newsList):
                self?.postList = newsList
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(class: SecondCell.self, for: indexPath)
        cell.viewController = SecondViewController.init()
        cell.configure(with: postList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
