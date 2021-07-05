//
//  UITableViewCell+Extension.swift
//  MVVM+DataSource+Coordinator
//
//  Created by Nika Kirkitadze on 05.06.21.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String { String(describing: self) }
    
    static var nib: UINib { UINib(nibName: identifier, bundle: Bundle.main) }
}
