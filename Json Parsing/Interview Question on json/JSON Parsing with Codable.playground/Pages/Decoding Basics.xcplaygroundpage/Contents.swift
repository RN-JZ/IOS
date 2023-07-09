 import UIKit
/*:
 ### Simple Objects
 */
let person1JSON =
"""
{
    "name": "James",
    "age": 45,
    "gender": "Male",
    "sign": "Sagitarius",
    "partner": "Emily",
    "isEmployed": true
}
"""

let person2JSON = """
{
    "name": "Mary",
    "age": 45,
    "gender": "Female",
    "sign": "Taurus",
    "isEmployed": false
}
"""
// WE MAKE SIMPLE JSON DATA SO FIRST SETP IS TO MAP THIS DATA IS STRUCT WITH DECODABLE PROTOCOAL
// DECOADABLE IS PROTOCOAL PROVIDED BY SWIFT WHICH WILL DECODE ALL BASIC TYPE FOR US
// IF PROPERTY TYPE IS NOT DEODABLE WE HAVE TO DEFINE OUR OWN CODING KEYS

struct Person:Decodable
{
    let name:String
    let age:Int
    let gender:String
    let sign:String
    let partner:String?
    let isEmployed:Bool
   
}

// NOTE: FOR STARTER WE ARE WORKING WITH STRING AND JSON DECODER NEED DATA OBJECT SO WE CONVERT OUR STRING TO DATA OBJECT
// SO DATA OBJECT IS SIMPLY ANY DATA TYPE WHICH WE CAN SO IN BYTES
// FOR EXAMPLE : HELLO WORLD  IN BYTES IS <48656C6C 6F2C2057 6F726C64 21>
// SO FIRST WE NEED TO CONVERT OUR STRING TO DATA OBJECT

let decoder = JSONDecoder()

let person1JsonData = person1JSON.data(using: .utf8)!

do{
    
let person1 = try decoder.decode(Person.self , from: person1JsonData)  // FIRST ONE IS TYPE AND SECOND IS THE data object which we want to decode
    print(person1.name)
    //print(person1.gender)
}
catch{
    print("FAILS TO DECODE DATA")
}

// HOW TO DECODE DATA WITH CUSTOME PROPERTY?
// THIS QUESTION MEANS IF WE HAVE JSON IN WHICH SOME PROPERT IS MISSING HOW WE GONNA HANDLE THAT
// IF WE SEE PERSON2 DATA IT MISSING (PARTNER) SO HOW WE HANDLE THIS CASE LET SAYA IF WE HAVE JSON LIKE THIS
//[{"name": "James","isEmployed": true},{"name": "Mary",}] SEE THE IS EMPLOYYE IS MISSING HOW TO HANDLE THIS

// ONE EASY WAY TO HANDLE THIS IS TO MAKE THE MISSING PROPERTY OPTION
// SECOND IS TO MAKE YOU OWN DECOABLE INITILIZER
// WE WILL SEE BOTH FOR NOW MAKE IT OPTIONAL
let person2JsonData = person2JSON.data(using: .utf8)!

do{
    
let person2 = try decoder.decode(Person.self , from: person2JsonData)  // FIRST ONE IS TYPE AND SECOND IS THE data object which we want to decode
    print(person2.name)
    print(person2.gender)
}
catch{
    print("FAILS TO DECODE DATA")
}



/*:
 ### Arrays
*/
// NOW LET SEE HOW TO DECODE ARRAY AGAIN A STRING MAKE DATA OBJECT
let personsJSON = """
[
    {
        "name": "James",
        "age": 45,
        "gender": "Male",
        "sign": "Sagitarius",
        "partner": "Emily",
        "isEmployed": true
    },
    {
        "name": "Mary",
        "age": 45,
        "gender": "Female",
        "sign": "Taurus",
        "isEmployed": false
    }
]
"""

let personsJsonData = personsJSON.data(using: .utf8)!
let personArray = try! decoder.decode([Person].self , from: personsJsonData)

for itr in personArray
{
    print(itr.name)
}
/*:
 #### More Complex Objects
 */
let familyJSON = """
{
    "familyName": "Smith",
    "members": [
        {
            "name": "James",
            "age": 45,
            "gender": "Male",
            "sign": "Sagitarius",
            "partner": "Emily",
            "isEmployed": true
        },
        {
            "name": "Mary",
            "age": 45,
            "gender": "Female",
            "sign": "Taurus",
            "isEmployed": false
        }
    ]
}
"""

struct Family:Decodable
{
    let familyName:String
    let members:[Person]
    
}

let familyJsonData = familyJSON.data(using: .utf8)!
let familyArray = try! decoder.decode(Family.self , from: familyJsonData)

for itr in familyArray.members
{
    print(itr.isEmployed)
}

/*:
 ## A Better model
 */




struct Family2:Decodable
{
    enum Gender:String,Decodable
    {
        case Male , Female , others
    }
    
    struct Person:Decodable
    {
        let name:String
        let age:Int
        let gender:Gender
        let sign:String
        let partner:String?
        let isEmployed:Bool
       
    }
    let familyName:String
    let members:[Person]
    
   
    
}
let family2JsonData = familyJSON.data(using: .utf8)!
let family2Array = try! decoder.decode(Family2.self , from: family2JsonData)

for itr in familyArray.members
{
    let val = itr.gender
    
    
    
    
   
    
}
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
