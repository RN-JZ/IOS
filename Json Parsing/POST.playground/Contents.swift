import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


func postData()
{
    var session = URLSession.shared
    guard let data = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        return
    }
    var request = URLRequest(url: data)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body :[String:AnyHashable] = [
        "userId": 1,
        "title": "MY STORY",
        "body": "Story of Pain and Suffering"
        
        
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options:.fragmentsAllowed)
    let task = session.dataTask(with: request)
    { (serviceData , serviceResponse , error) in
        
        if error == nil
        {
            let httpResponse = serviceResponse as! HTTPURLResponse
            
            do
            {
                
           
            
                let jsonObject = try? JSONSerialization.jsonObject(with: serviceData! , options: .allowFragments)
            //print(jsonObject)
                print(jsonObject)
              
                
                
            
            }catch{
                print("SOME THING WENT WRONg")
            }
            
        }
        
    }
    task.resume()
    
}
postData()
