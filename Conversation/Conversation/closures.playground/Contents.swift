//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



var sayHelloTo: (name: String) -> String = {
name in return "Hello \(name)"
}


sayHelloTo(name: "Mac")


var andAlsoGoodByeTo: (name: String) -> String = { name in return "Goodbye \(name)"
}


func sayHelloAndGoodbye(name: String, hello: String -> String, goodbye: (String) -> String) -> String {
    
    
    return hello(name) + goodbye(name)
}


sayHelloAndGoodbye("Mac", hello: sayHelloTo, goodbye: andAlsoGoodByeTo)


