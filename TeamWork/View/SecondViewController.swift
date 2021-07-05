//
//  ViewController.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: PostViewModelProtocol!
    private var dataSource: PostDataSource!
    private var profilesManager: ProfileManagerProtocol!
    
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
        viewModel = PostViewModel(with: FeedManager)
        dataSource = PostDataSource(with: tableView, viewModel: viewModel)
        
    }
    
    private func bindings() {
        viewModel.didFinishedLoading = {
        }
    }
    


}

