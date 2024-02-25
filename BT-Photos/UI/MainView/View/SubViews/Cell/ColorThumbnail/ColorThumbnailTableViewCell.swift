//
//  ColorThumbnailTableViewCell.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 25/02/24.
//

import UIKit

class ColorThumbnailTableViewCell: UITableViewCell {

    @IBOutlet weak var imgThumbnail: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var idName: UILabel!
    
    @IBOutlet weak var albumidName: UILabel!
    
    override func awakeFromNib() {
        imgThumbnail.layer.cornerRadius = 10
        imgThumbnail.layer.masksToBounds = true
        self.selectionStyle = .none
    }
}
