//
//  CAGradientLayer+App.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-11.
//

import UIKit

extension CAGradientLayer {
    
    /// Apply gradient by given angle
    func apply(angle: CGFloat) {
        let x = angle / 360

        let a = pow(sin(.pi * (x + 0.75)), 2)
        let b = pow(sin(.pi * (x + 0.0)), 2)
        let c = pow(sin(.pi * (x + 0.25)), 2)
        let d = pow(sin(.pi * (x + 0.5)), 2)

        endPoint = CGPoint(x: c, y: d)
        startPoint = CGPoint(x: a, y: b)
    }
}
