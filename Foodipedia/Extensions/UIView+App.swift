//
//  UIView+App.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-11.
//

import UIKit

extension UIView {
    
    /// Apply gradient colors to the view
    func addGradient(colors: [UIColor], opacity: Float, angle: Double = 0) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors.map({ $0.cgColor })
        gradient.opacity = opacity
        gradient.apply(angle: angle)
        layer.insertSublayer(gradient, at: 0)
    }
    
    /// Apply drop shadow to the view
    func dropShadow(shadowRadius: CGFloat = 20,
                    shadowOpacity: Float = 1.0,
                    shadowColor: UIColor = UIColor.black,
                    shadowOffset: CGSize = CGSize.zero) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
