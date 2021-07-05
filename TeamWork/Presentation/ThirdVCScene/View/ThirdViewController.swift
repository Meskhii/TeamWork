//
//  ThirdViewController.swift
//  TeamWork
//
//  Created by user200328 on 7/5/21.
//

import UIKit
import Kingfisher

class ThirdViewController: BaseViewController {
    
    var feedModel: FeedModel?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        
        configureFeed()
    }
    
    private func configureFeed() {
        guard let feed = feedModel else {return}
        
        newsTitleLabel.text = feed.title
        imageView.kf.setImage(with: URL(string: feed.imageUrl ?? ""))
        authorNameLabel.text = feed.author
        postDateLabel.text = feed.time
        postLabel.text = feed.description
        
    }

    @IBAction func backTapped(_ sender: Any) {
        coordinator?.popViewController()
    }
    
    @IBAction func bookmarkTapped(_ sender: Any) {
        
    }
    
}
