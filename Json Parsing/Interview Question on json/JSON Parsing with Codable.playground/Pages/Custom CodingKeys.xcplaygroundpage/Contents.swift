/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Custom CodingKeys

Some JSON does not immediately conform to the Decodable protocol so you may have to do some extra work with CodingKeys to may the JSON comply.

*/
// THERE WILL BE TIMES WHEN WE HAVE TO MAKE OUR OWN CUSTOME DECOABLE
// WE WILL SEE 3 EXAMPLE
//interview questions
//Q1: HOW CAN WE DECODE USING CUSTOME DECODER

// IN BELOW JSON WE SEE THAT IN ONE PLACE ENTRY IS [] AND OTHER IT IS SIMPLE VALUE SO TO HANDLE THI CASE WE USE CUSTOM DECODE
import UIKit
let booksJSON = """
[
  {
    "feed": {
      "publisher": "Penguin",
      "country": "ca"
    },
    "entry": [
      {
        "author": "Margaret Atwood",
        "nationality": "Canadian"
      },
      {
        "author": "Dan Brown",
        "nationality": "American"
      }
    ]
  },
  {
    "feed": {
      "publisher": "Penguin",
      "country": "ca"
    },
    "entry": {
      "author": "Pierre Burton",
      "nationality": "Canadian"
    }
  }
]
"""
struct Feed: Decodable {
    let publisher: String
    let country: String
}

struct Entry: Decodable {
    let author: String
    let nationality: String
}

struct Book: Decodable {
    enum CodingKeys:String , CodingKey
    {
        case feed,entry
    }
    let feed: Feed
    var entry: [Entry]

    init(from decoder:Decoder)throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        feed = try container.decode(Feed.self, forKey: .feed)
        do{
            entry = try container.decode([Entry].self, forKey:.entry)
        }
        catch{
            let temp = try container.decode(Entry.self, forKey:.entry)
            entry = [temp]
        }

    }
}


// SECOND WAY TO DO SAME THING

//// MARK: - WelcomeElement
//struct WelcomeElement: Codable {
//    let feed: Feed
//    let entry: EntryUnion
//}
//
//enum EntryUnion: Codable {
//
//    case entryElementArray([EntryElement])
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode([EntryElement].self) {
//            self = .entryElementArray(x)
//            return
//        }
//        if let x = try? container.decode(EntryElement.self) {
//            let temp = [x]
//            self = .entryElementArray(temp)
//            return
//        }
//        throw DecodingError.typeMismatch(EntryUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for EntryUnion"))
//    }
//
//
//}
//
//// MARK: - EntryElement
//struct EntryElement: Codable {
//    let author, nationality: String
//}
//
//// MARK: - Feed
//struct Feed: Codable {
//    let publisher, country: String
//}




let decoder = JSONDecoder()
let data = booksJSON.data(using: .utf8)!

let value = try! decoder.decode([Book].self, from: data)

for book in value {
    print(book.feed.publisher)
}


// SECOND QUESTION
// Q HOW TO HANDLE MISSING VALUE IN JSON
// ANS WE SEE PREVIOUSLY THAT WE CAN HANDLE THAT BY USING OPTIONLA VALUE THERE ANOTHER WAY

let person2JSON = """
{
    "name": "Mary",
    "age": 45,
    "gender": "Female",
    "sign": "Taurus",
    "isEmployed": false
}
"""

struct Person:Decodable
{
    let name:String
    let age:Int
    let gender:String
    let sign:String
    let partner:String // WE MAKE THIS OPTIONAL in (decoding basic )BECAUSE WE DONOT HAVE THAT IN JSON
    let isEmployed:Bool
    enum CodingKeys: String, CodingKey {
           case name, age, partner ,gender, sign , isEmployed
       }
   
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey:.name)
        age = try container.decode(Int.self, forKey:.age)
        gender = try container.decode(String.self, forKey:.gender)
        sign = try container.decode(String.self, forKey:.sign)
        partner = try (container.decodeIfPresent(String.self,
                                                 forKey: .partner)) ?? "N/A"
        isEmployed = try container.decode(Bool.self, forKey:.isEmployed)
        
    }
}



let person2JsonData = person2JSON.data(using: .utf8)!

do{
    
let person2 = try decoder.decode(Person.self , from: person2JsonData)  // FIRST ONE IS TYPE AND SECOND IS THE data object which we want to decode
    print(person2)
    print(person2.gender)
}
catch{
    print("FAILS TO DECODE DATA")
}




// Q3 DECODE JSON SAME PROPERT CAN HAVE DIFFERENT TYPE INT OR STRING


let somejson = """
{
  "members" : [
    {
      "firstName": "John",
      "age": "30",
      "salaries": [50000, 60000, 70000]
    },
    {
      "firstName": "Alice",
      "age": 25,
      "salaries": [45000, 55000]
    },
    {
      "firstName": "Michael",
      "age": 35,
      "salaries": [60000, 65000, 70000, 75000]
    }
  ]

}
"""


struct Memberarray : Decodable {
    let members: [Member]
}
struct Member: Codable {
    let firstName: String
    let age: TYPE
    let salaries: [Int]
}

// MARK: - Member


enum TYPE:Codable
{
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        
        if let value = try? decoder.singleValueContainer().decode(Int.self)
        {
            self = .int(value)
            return
        }
        else if let val = try? decoder.singleValueContainer().decode(String.self)
        {
            self = .string(val)
            return
        }
        else
        {
            throw DecodingError.typeMismatch(TYPE.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Age"))
        }
        
    }
    
}

let person2JsonData2 = somejson.data(using: .utf8)!

do{
    
let person2 = try decoder.decode(Memberarray.self , from: person2JsonData2)  // FIRST ONE IS TYPE AND SECOND IS THE data object which we want to decode
    print(person2.members[0].age)
}
catch{
    print("FAILS TO DECODE DATA")
}




/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
