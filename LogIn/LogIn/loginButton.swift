//
//  loginButton.swift
//  Login
//
//  Created by Anjel Villafranco on 10/15/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

@IBDesignable

class loginButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
        }
    }
}
