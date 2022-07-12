//
//  String+Localize.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-09.
//

import Foundation

extension String {
    
    /// Returns localized string
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
