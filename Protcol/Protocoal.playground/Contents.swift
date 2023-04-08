import UIKit

//RULES:
//the comment written in captial will be from some other person and written in small will be me
// when you read follow the order i write it in


//FIRST (1)
// ANGELA COURSE PROTOCOAL
// Q WHAT IS PROTOCOAL ?
// Ans : PROTOCOAL ARE LIKE CERTIFICATE WHICH HAVE THESE REQUIREMENT AND CLASS WHICH INHERIT THEM MEET THOSE REQUIREMENT

//SYNTAX:
//   protocol MYprotocoal
//{
//       // some requirement
//}
    
// or in more simpler term protocoal are like abstract class which have some sepecific function and the class which inherit them will
// provide implementation for that function





//SIX(6)
//THIS IS LIKE CERTIFICATE AS I DISCUUS EARLIER EVERYONE THAT CAN FLY OR DO TRAINING OF FLYING LIKR PILOT CAN USE THIS PROTOCOAL FLY
protocol CANFLY
{
    // PROTOCOL DONOT HAVE IMPLEMENTATION LIKE FUNCTION ANYONE  WHO USE THIS PROTOCOAL WILL PROVIDE IMPLEMENTATION BY THEM SELF
    func fly()
}



//SECOND (2)
class Bird
{
    var isFemale = true
    
    // SEVEN(7)
    // WE DONOT NEED THIS CLASS BECAUE WE HAVE PROTOCOAL NOW AND EVERY CLASS WHICH NEED TO FLY USE THAT INTEAD OF BIRD
//    func fly()
//    {
//        print("The bird flag wings and lifts off in sky")
//    }
    
    func layEgg()
    {
        if isFemale
        {
            print("The bird make new bird in shell")
        }
    }
}


//THREE (3)
class Eagle:Bird , CANFLY
{
    
    // as i write on comment above prtocoal that each class need to represent this method
    func fly() {
        print("The Eagle flag wings and lifts off in sky")
    }
    
  func soar()
 {
     print("THE EAGLE CAN SOAR IN AIR")}
    
}

// FOUR (4)
class penguin:Bird
{
  func swin(){print("THE Peguin paddle through the water")}
}


//FIVE (5)

// TO DEMONSTRATE PROBLEM MORE WE CREATE THE CLASS OF PLANE SO PLANE ALOS FLY AND ONLY THING THAT CAN FLY AT THIS POINT IN BIRD SO
// WE INHERIT IT FROM BIRD AND WE CALL FLY METHOD IT WILL PRINT
// The bird flag wings and lifts off in sky"  but we want plane to fly not but to overcome this can user ploymorphism and override method
// THIS SOLVE THE PROBLEM BUT GIVE US ANOTHER PROBLEM NO OUR PLANE CAN LAYEGG ALSO  which is strange thing as i told below the problem  lies that we rely haviy on inheritnave
// ANOTHER THING IS WE CANNOT APPLY INHERITNCE ON STRUCT SO HOW WE USE SOME OTHE THING THAT STRUCT ALSO CAN INHERIT MAY BE WE SHOULD NOT BE USING IHERITANCE BUT WHAT CAN WE USE SO WE CAN OVERCOME THIS PROBLEM THAT WERE PROTOCOAL COMES TO RESCUE
//EIGHT(8) WE CAN MAKE THIS CLASS STRUCT NOW AS IT DONOT NEED ANY THINGS TO BE INHERIT
//class AirPlan:Bird , CANFLY
//{
//    func fly() {
//        print("PLANE FLY WITH PASSENGER")
//    }
//
//}

struct AirPlan:CANFLY
{
    func fly() {
        print("PLANE FLY WITH PASSENGER")
    }
    
}


//THIRD (3)
let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()



//four (4)
//PROBLEM ARRISE HERE NOW MY PEGUIN CAN SWIM LAY EGG AND THE ALSO GOING TO FLY ;)
//THE PROBLEM IS THAT WE ARE ASSUMING THAT ALL BIRD CAN FLY
//WE ARE RELYING HEAVILY ON INHERTANCE  AND SUBCLASSES
let myPeguin = penguin()




// note
//1) ONE CLASS OR STRUCT CAN HAVE A MULTIPLE PROTOCOAL
//2) YOU CAN NOT INTENTIATE PROTOCOAL YOU CAN USE THEM WITH STRUCT , CLASS AND ENUM
//2) IF CLASS NEED TH INHERIT SUPER CLASS IT WILL INHERIT SUPERCLASS FIRST AND LATTER IT WILL IHERIT PROTOCOAL
//3)ALL IN ALL PROTOCOAL IS VERY POWERFUL TERMINOLOGY WHICH USED IN IOS SWIFT AND UIKIT VERY OFTEN SO WHENEVER WE NEED TO MAKE SUCH
//  FUNCTION WHICH CAN INHERIT OR USE BY MUTIPLE CLASS WE USE PROTOCOAL



/// LETS DIVE DEEP INTO PROTOCOAL AND SEE SOME OTHER FUNCTIONALITY OF PROTOCOAL
///


enum Direction
{
    case left
    case right
}

protocol Vehicle
{
    // we can also decelare computed propeties in protocoal
    // WHEN DEFINIGN PROPERTIES WE NEED TO SET GET AND SET
//    The fact that you must mark get and set on properties shows that a protocol
//    doesn’t know about a property’s implementation, which means it makes no
//    assumption about the property’s storage. You can then implement these properties
//    as computed properties or as regular variables. All the protocol requires is that the
//    property is either readable, if it has only a get requirement, or readable and
//    writable, if it has both a get and a set requirement.
    
    var weight:Int{get}
    var name:String{get set}
    func accelerate()
    func stop()
    
    // we can also create method that take argument and return some argument
    func descrition()->String
    func turn(dirrction:Direction)
}
extension Vehicle
{
    func stop()
    {
        print("STOP IT")
    }
}

// it donot have implementation we canot initilize it
// Vehicle() // ERROR:-Vehicle' cannot be constructed because it has no accessible initializers


//A protocol can be adopted by a class, struct, or enum — and
//when hen another type adopts a protocol, it’s required to implement the methods and properties defined in
//the protocol.
// Once a type implements all members of a protocol, the type is said to conform to the protocol.

//Here’s how you declare protocol conformance for your type. In the playground,
//define a new class that will conform to Vehicle:

class Unicycle:Vehicle
{
    
    // AS I MAKE THIS PROPERTY REABLE PROPERTY ONLY IN PROTOCOAL WE CAN EVEN MAKE IT WRITABLE OR SIMPEL STORE PROPERT BECAUSE PROTOCOAL MAKE NO ASSUPTIOM ABOUT IMPLEMENTATION OF PROPOERTY AS I TOLD ABOVE
    
    //imp , a conforming class can provide any implementation it wants for the protocol's requirements, as long as it fulfills those requirements.
    var weight: Int{
        get{
        return 10000
        }
        set(newValue){
            print("The value is \(newValue)")
        }
    }
    var carName = ""
    
    var name: String
    {
        get{
            return "THE NAME IS \(carName)"
        }
        set(newValue){
            carName = newValue
        }
    }
    
    func descrition() -> String {
        return "TO LAHORE"
    }
    
    func turn(dirrction: Direction) {
        switch dirrction
        {
        case .left:
            print("Moving left")
        case .right:
            print("MOving right")
        }
    }
    
    var speed = false
    func accelerate() {
        speed = true
    }
    
   
    
    
    
}





//Initializers in protocols
//While protocols themselves can’t be initialized, they can declare initializers that
//conforming types should have:
protocol Account {
 var value: Double { get set }
 init(initialAmount: Double)
 init?(transferAccount: Account)
}
//In the Account protocol above, you define two initializers as part of the protocol.
//This behaves much as you might expect, in that any type that conforms to Account
//is required to have these initializer.
//Although enforcing initializers in protocols can be useful, they also let you create an
//instance of a type that conforms to that protocol:
class BitcoinAccount: Account {
 var value: Double
 required init(initialAmount: Double) {
 value = initialAmount
 }
 required init?(transferAccount: Account) {
 guard transferAccount.value > 0.0 else {
 return nil
 }
 value = transferAccount.value
 }
}
var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)


//SEE THIS WHEN YOU NEED IN FUTURE




// if we want to know that protocoal are reference type ot value type it defend upon who inherit them if struct them value type and vice verse
// you can make you prortocol reference type by confroming thme to class only

// THIS PROTOCOLA WILL BE FOR CLASS ONLY
protocol Name:class
{
    // some methon
}


// NOTE:
// YOU CAN AGAIN READ FROM BOOK FROM PAGE 259 TO SEE PRTOCOAL IN STATNDERD LIBRARY
// SOME XCODE DONOT GIVE ERROR  TO APPLY THIS METHOD WHEN WE INHERIT PROTOCOAL BECAUSE IT HAS DEFAULT IMPLEMETATION
// APPLE DEVELOPER EXTEND PROTOCOAL AND APPLY DEFAULT IMPLEMETATION YOU CAN SEE ABOVE EXMAPLE

