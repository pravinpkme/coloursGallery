//
//  UIVIewController+Extension.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 25/02/24.
//

import Foundation
import UIKit
extension UIViewController{
    func showToast(message: String, completion: (() -> Void)? = nil) {
        let toastWidth: CGFloat = 300
        let toastHeight: CGFloat = 50
        
        let centerX = self.view.frame.size.width / 2
        let centerY = self.view.frame.size.height / 2
        
        let toastLabel = UILabel(frame: CGRect(x: centerX - toastWidth / 2, y: centerY - toastHeight / 2, width: toastWidth, height: toastHeight))
        
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = .systemFont(ofSize: 16)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            completion?()
            toastLabel.removeFromSuperview()
        })
    }

}
