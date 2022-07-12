//
//  String+Attributed.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-12.
//

import UIKit

extension String {
    
    /// Generate attributed string for button title
    func attributedButtonTitle(color: UIColor = .black) -> NSAttributedString? {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        let attributedString = NSMutableAttributedString(string: self)
        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraph,
                                                          .font: UIFont.systemFont(ofSize: 25, weight: .light),
                                                          .kern: 2.0,
                                                          .foregroundColor: color]
        attributedString.addAttributes(attributes, range: NSMakeRange(0, self.count))
        return attributedString
    }
}
