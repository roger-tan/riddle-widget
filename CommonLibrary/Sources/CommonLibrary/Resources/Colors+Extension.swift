//
//  Colors+Extension.swift
//  
//
//  Created by Roger Tan on 30/07/2020.
//

import UIKit

public extension UIColor {
    static var primaryBackground: UIColor {
        UIColor(named: "PrimaryBackground", in: .module, compatibleWith: nil)!
    }
    
    static var primaryColor: UIColor {
        UIColor(named: "PrimaryColor", in: .module, compatibleWith: nil)!
    }
    
    static var primaryText: UIColor {
        UIColor(named: "PrimaryText", in: .module, compatibleWith: nil)!
    }
    
    static var secondaryText: UIColor {
        UIColor(named: "SecondaryText", in: .module, compatibleWith: nil)!
    }
}

