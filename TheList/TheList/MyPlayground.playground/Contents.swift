//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


protocol ChildDelegate {
    
    func iAmHungry()

}

class Parent : ChildDelegate {
    
    var children: [Child] = []
    
    func makeABaby() {
    
    let baby = Child()
        baby.delegate = self
        children.append(baby)
        
    }
    
    func iAmHungry() {
        <#code#>
    }

}

class Child {

    var delegate: ChildDelegate? // parent
    
    func bellyRumbles() {
    
        delegate?.iAmHungry()
    
    }


}