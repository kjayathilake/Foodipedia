//
//  CAGradientLayer+App.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-11.
//

import UIKit

extension CAGradientLayer {
    
    /// Apply gradient by given angle
    func apply(angle: Double) {
        let x: Double! = angle / 360.0
        let a = pow(sinf(Float(2.0 * Double.pi * ((x + 0.75) / 2.0))), 2.0)
        let b = pow(sinf(Float(2 * Double.pi * ((x + 0.0) / 2))), 2)
        let c = pow(sinf(Float(2 * Double.pi * ((x + 0.25) / 2))), 2)
        let d = pow(sinf(Float(2 * Double.pi * ((x + 0.5) / 2))), 2)
        
        endPoint = CGPoint(x: CGFloat(c), y: CGFloat(d))
        startPoint = CGPoint(x: CGFloat(a), y: CGFloat(b))
    }
}
