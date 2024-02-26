//
//  PhotoCollectionViewCell.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 24/02/24.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }

}
