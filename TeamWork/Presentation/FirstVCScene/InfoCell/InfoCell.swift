//
//  InfoCell.swift
//  TeamWork
//
//  Created by AltaSoftware MacMINI on 7/5/21.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    @IBOutlet weak var welcomeImage: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with item: InfoViewModel) {
        welcomeImage.kf.setImage(with: item.imageUrl)
        welcomeLabel.text = item.text
        
    }
}
