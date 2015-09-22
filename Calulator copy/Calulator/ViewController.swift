//
//  ViewController.swift
//  Calulator
//
//  Created by Anjel Villafranco on 9/21/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

var number1 = ""
var number2 = ""
var operation: OperationType?

// normal
//change the sign +/-
//remove the decimal if .0

//medium:
//add label on the left side of display to show current operation

//Hard
//make decimal button work

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!

    @IBAction func numberPressed(button: UIButton) {
        
         let num = button.titleLabel!.text!
        
        if operation == nil {
        
           number1 += num
            
        displayLabel.text = number1
        } else {
            
           number2 += num
            
           displayLabel.text = number2
        
        
        }
        
    }
    
    @IBAction func clear() {
        
         number1 = ""
         number2 = ""
        operation = nil
       displayLabel.text = "0"
        
    }
    
    @IBAction func changeSign() {
        
        
    }
    
    @IBAction func setOperation(button: UIButton) {
        
        let opSign = button.titleLabel!.text!
        
        operation = OperationType(rawValue: opSign)
        
        
    }
    
    @IBAction func runOperation() {
        
        let num1 = Double(number1)
        let num2 = Double(number2)
        
        let total = calculateNumbers(n1: num1!, n2: num2!, operation: operation!)
        
        number1 = "\(total)"
        displayLabel.text = "\(total)"
        
        

    }
}

