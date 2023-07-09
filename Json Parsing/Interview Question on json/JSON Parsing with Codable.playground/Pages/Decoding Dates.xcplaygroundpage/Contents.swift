/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Decoding Dates
There are many ways to represent a date on the Internet.  ISO-8601 is the most command and Decodable is able to handle dates that are in that format. but what if you have a date in your JSON file or fee that is a differen format?
*/
import UIKit// Consider this json code snippet
import Foundation

// INTERVIEW QUESTIONS


/*:
 ### Example 1
 DateFormatter strategy
 */
let personJson = """
{
  "id" : 7,
  "name" : "Aidan Lynch",
  "birthday" : "27-03-1993",
}
"""

struct Person: Codable
{
    let id: Int
    let name:String
    let birthday: Date
}

let formatter = DateFormatter()
formatter.dateFormat = "dd-MM-yyyy"

//making data object

let personJsondata = personJson.data(using: .utf8)!

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(formatter)

let result = try! decoder.decode(Person.self, from: personJsondata)

result.birthday




/*:
### Example 2
 Other DateDecodingStrategies
*/


