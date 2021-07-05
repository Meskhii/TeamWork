//
//  ViewController.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit

class SecondViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: PostViewModelProtocol!
    private var dataSource: PostDataSource!
    private var feedManager: FeedManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource.refresh()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: SecondCell.self)
    }
    
    private func configureViewModel() {
        feedManager = FeedManager()
        viewModel = PostViewModel(with: feedManager)
        dataSource = PostDataSource(with: tableView, viewModel: viewModel)
        
    }
    
    private func bindings() {
        viewModel.didFinishedLoading = {
        }
    }
    


}

