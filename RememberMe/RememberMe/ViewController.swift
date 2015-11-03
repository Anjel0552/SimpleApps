//
//  ViewController.swift
//  RememberMe
//
//  Created by Anjel Villafranco on 10/12/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name: String? {
    
        set {
        
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "name")
            
        }
    
        get {

         
            return NSUserDefaults.standardUserDefaults().objectForKey("name") as? String

        }
    }
    
    @IBOutlet weak var myField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func hitButton(sender: AnyObject) {
        
        name = myField.text
        
        if let name = myField.text {
        
            myLabel.text = "Hi \(name)"
        
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = name {
        
            myLabel.text = "Welcome Back \(name)"
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

