//
//  SecondCell.swift
//  TeamWork
//
//  Created by Ilia Tsikelashvili on 05.07.21.
//

import UIKit

class SecondCell: UITableViewCell {
    @IBOutlet weak var labelAuthor      : UILabel!
    @IBOutlet weak var labelDescription : UILabel!
    @IBOutlet weak var imgView          : UIImageView!
    @IBOutlet weak var profileImage     : UIImageView!
    @IBOutlet weak var labelTime        : UILabel!
    
    var viewController: UIViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgView.layer.cornerRadius = 16
        self.profileImage.layer.cornerRadius = 22
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: ProfileViewModel) {
        imgView.kf.setImage(with: "\(item.imageOrd)")
        labelTime.text = item.time
        labelDescription.text = item.title
        labelAuthor.text = item.author
        profileImage.kf.setImage(with: "\(item.imageProfile)")
    }

    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Coming Soon", message: nil, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: nil))

        self.viewController!.present(alert, animated: true, completion: nil)
    }
}
