//
//  CalculatorFunctions.swift
//  Calulator
//
//  Created by Anjel Villafranco on 9/22/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import Foundation

enum OperationType: String {
    
    case Addition = "+"
    case Subtraction = "-"
    case Multiplication = "x"
    case Division = "/"
    case Modulo = "%"
    
}

func calculateNumbers(n1 n1: Double, n2: Double, operation: OperationType) -> Double {
    
    
    switch operation {
        
    case .Addition : return n1 + n2
        
    case .Subtraction :  return n1 - n2
        
    case .Multiplication : return n1 * n2
        
    case .Division : return n1 / n2
        
    case .Modulo : return n1 % n2
        
    }
    
}

