//: Playground - noun: a place where people can play

import UIKit


//////////////////
//////////////////
////////////////// STRUCT (a struct does not share references)
//////////////////


var name = "Jo"

unsafeAddressOf(name)   
// unsafeAddressOf(name) is where the value is being stored

var name2 = name

unsafeAddressOf(name2)

name2.appendContentsOf("e")

name

//////////////////
////////////////// CLASS
//////////////////

var name3: NSMutableString = "Jo"

unsafeAddressOf(name3)

var name4 = name3

unsafeAddressOf(name4)

name4.appendString("ey")
name3

name3 = "Tim"
//line 40 has nothing to do with line 29. they are two sepereate locations because we changed the object witch resulted in a new location
name4

unsafeAddressOf(name3)





