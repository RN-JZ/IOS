import UIKit



// THIS CLASS IS GOING TO MAKE COFFE FOR PERSON FOR COFFE MAKING CAN TAKE SOME TIME
// FIRST PERSON NEED TO CALL FUNCTION MAKE COFFE
// THEN WHEN COFFE MADE WE NEED TO CALL MESSAGE GETYOURCOFFE
//class CoffeMaker
//{
//    var obj:Person?
//    func MakeCoffee()
//    {
//        print("MAKING YOUR COFFEE")
//        obj?.getYourCoffee() // CALL THE PERSON TO GET HIS COFFE COFFE IS READY
//    }
//}
//
//struct Person
//{
//
//
//    func getYourCoffee()
//    {
//        print("GET YOU COFFE REMOVE THE CUP")
//    }
//}
//
//
//// let build a little analogy
//var coffee = CoffeMaker()  // A PERSON ENTER IN COFFE SHOP
//coffee.obj = Person()      // A PERSON ORDER A COFFE AND GET TOKKEN
//coffee.MakeCoffee()        // MACHINE START MAKING COFFE

// THIS ALL IS A DELEGATE PATTERN
// PERSON DONOT KNOW ANY THING ABOUT HOE COFFE IS MADE
// HW JUST REGISTER HIMSELF TO GET COFFE
// COFFEMAKER MAKE IT AND GIVE IT TO PERSON

// PROBLEM :
// LET SAY A PERSON2 ALSO WANT TO HAVE COFFEE BUT THE ONLY PERSON WHO CAN GET COFFE IS PERSON1
// THIS TYPE OF PROBLEM IS CALLED TIGHT COUPLING
// WHEN CLASS IS DEPENDENT ON OTHER CLASS THEN THIS IS CALLED TIGHT COUPLE LIKE IN OUR CASE COFFEMAKER DEPENDENT ON PERSON ONLY
// TO RESOLVE THIS PROBLEM WE CAN USE PROTOCOAL


protocol COFFEMACHINEDELEGATE
{
    func getYourCoffee()
}


// THIS IS DEFAULT IMPKMENTATION OF PROTOCOAL
// SOME THIME YOU INHERIT PRTOCOAL BUT YOU DONOT GET SUGGESTION TO ADD THIS METHOS APPLE DEVELOPER PROVIDE THEIR DEFAULT IMPLEMENTAION IF YOU WANT THAT FUNCTION YOU HAE TO MANUALL ADD THEM LIKE UITEXTFIELD DELEGATE METHOD (DID-FINISH-EDITING)
// working on our analogy a person come to coffe shop buy token and coffe start preparing but that person need to attend some urgent business son he goes away and now there is no one to get coffe so we put coffe on out default counter where all abandon coffes go ;)
// IN CODE WHEN WE DONOT FIND SUCH METHOD IN CHILD CLASS OUT CODE CALL DEFAULT IMPLEMETATION GETyOURcOFFE
extension COFFEMACHINEDELEGATE
{
    func getYourCoffee()
    {
        print("SOME ONE PLEASE GET THEIR COFFE")
    }
}

class CoffeMaker
{
    var delegate:COFFEMACHINEDELEGATE?
    func MakeCoffee()
    {
        print("MAKING YOUR COFFEE")
        delegate?.getYourCoffee() // CALL THE PERSON TO GET HIS COFFE COFFE IS READY
    }
}

class person:COFFEMACHINEDELEGATE
{
//
//    func getYourCoffee() {
//        print("GET YOU COFFE REMOVE THE CUP")
//    }
    
    
}

var coffee = CoffeMaker()  // AGAIN SOME PERSON ENTER IN COFFE SHOP
coffee.MakeCoffee()        // WE START MAKING COFFEE BUT HE NEVER ORDER COFFEE JUST THERE TO USE FREE WIFI ;)
coffee.delegate = person() // AFTER SOME TIME THAT PERSON ASK FOR COFFE BUT HE DONOT BUY TOKKEN (IN PROGRAMMING TERM PERSON CLASS DONOT INHERIT PROTOCOAL AND WE CANOT ASSIGN A TYPR OF PERSON TO COFFEMACHINEDELEGATE) so we donot give him coffe


var coffee1 = CoffeMaker()  // A PERSON ORDER A COFFE AS SOON HE ENTER WE CALL HIM AS SOON AS COFFE GETS READY
coffee1.delegate = person()
coffee1.MakeCoffee()

// so that all about delegate
