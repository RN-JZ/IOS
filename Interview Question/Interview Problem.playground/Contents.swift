import UIKit
import Foundation



struct Sample : Codable {
    let members: [Member]
}

// MARK: - Member
struct Member: Codable {
    let firstName , lastName: String
    let age: Int
    let dateCreated : Date
    let secretIdentity: String
    
    
    enum CodingKeys:String , CodingKey
    {
        case dateCreated = "formed"
        case firstName , lastName
        case age
        case secretIdentity
    }
   
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            firstName = try container.decode(String.self, forKey: .firstName)
            lastName = try (container.decodeIfPresent(String.self, forKey: .lastName)) ?? "N/A"
            dateCreated = try container.decode(Date.self, forKey: .dateCreated)
            age = try container.decode(Int.self, forKey: .age)
            secretIdentity = try container.decode(String.self, forKey: .secretIdentity)
}
}




// 1. How do you decode data in iOS? JSoNDecoder/ Jsonserialization
//2. What is codable?
// 3. How to decode data with custom properties?
// if we have some value missing i json we can make that property option in model that how we can do that
// 6. How can we decode using custom decoder?
// For tht you can wath vido
// 7. How to decode same properties with different data type?
// or tht you can wath vido


func DatafromFile() {
        do {
            if let bundlePath = Bundle.main.path(forResource: "Data",
                                                 ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
            {
                //decodeData(jsonData)
                //MARK: - 4. How can we decode date to date property?
                // 5. What is convertFromSnakeCase?
                decodeDate(jsonData)
            }
        } catch {
            print(error)
        }
    }

func decodeData(_ jsonData:Data)
{
    do{
        let data = try JSONDecoder().decode(Sample.self, from: jsonData)
        print("Data is = \(data.members)")
    }
    catch {
       print(error)
   }
}

func decodeDate(_ jsonData:Data)
{
    // TO DECODE STRING AS A DATE WE CAN USE FORMATE CLASS TO THE TYPE OF DATE WE NEED
    // AND THEN PASS THAT TO DECODE
    do{
        let formatter = DateFormatter()
        //"20:32 Wed, 30 Oct 2018"
        formatter.dateFormat = "HH:mm EEE, dd MMM y"
        let decodder = JSONDecoder()
        decodder.keyDecodingStrategy = .convertFromSnakeCase
        decodder.dateDecodingStrategy = .formatted(formatter)
        
        
        let data = try decodder.decode(Sample.self, from: jsonData)
        print("Data is = \(data.members)")
    }
    catch {
       print(error)
   }
}


DatafromFile() 
