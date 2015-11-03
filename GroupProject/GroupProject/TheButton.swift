//
//  TheButton.swift
//  GroupProject
//
//  Created by Anjel Villafranco on 10/29/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

@IBDesignable

class TheButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0
    
    override func drawRect(rect: CGRect) {
        
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
        layer.borderWidth = borderWidth
    }

    @IBInspectable var borderWidth: CGFloat = 0

   
}
