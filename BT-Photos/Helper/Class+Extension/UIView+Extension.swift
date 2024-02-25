//
//  UIView+Extension.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 25/02/24.
//

import Foundation
import UIKit

extension UIView {
    // MARK: -Rounded Corner
    func addRoundedBorder(withColor color: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = borderWidth
        layer.addSublayer(shapeLayer)
    }
    // MARK: - Circular
    func makeCircular() {
        self.layer.cornerRadius = min(self.bounds.width, self.bounds.height) / 2.0
        self.layer.masksToBounds = true
    }
    
    // MARK: -Adding Gesture
    func addTapGesture(target: Any?, action: Selector?) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    
}
