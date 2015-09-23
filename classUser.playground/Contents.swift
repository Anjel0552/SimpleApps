////: Playground - noun: a place where people can play
//
//import UIKit
//
//var str = "Hello, playground"
//
//
//
//
//
//
//class User {
//
//    
//
//}
//
//
//
//
//
//
//
//
//// Optionals
//
//var color: String?
//
//color = "Red"
//
//print(color == nil)
//
//if color != nil {
//
//    print(color!)
//
//}
//
//if let c = color {
//
// print(c)
//    
//}
//
//// print("The color is " + color)
//
//if let c = color {
//
//   print("the color is " + c)
//
//}
//



enum FavoriteColor : String {

    case Black
    case Magenta
    case Blue
    case Red
    case Yellow




}

class User {

    var name: String!
    var email: String!
    var password: String!
    var favoriteColor: FavoriteColor?

    func sayHelloTo(name: String) {
    
    
        print("\(self.name) says hello to \(name)")
        
    }

    func register(name: String, email: String, password: String) {
    
        self.name = name
        self.email = email
        self.password = password
    
    }
}

//User().register("Anjel", email: "AJ22@g.com", password: "kjsdhfkjdghkdf")
//
//User().sayHelloTo("BOB")

let Anjel = User()

Anjel.register("Anjel", email: "AJ22@g.com", password: "kjsdhfkjdghkdf")

Anjel.sayHelloTo("BOB")



