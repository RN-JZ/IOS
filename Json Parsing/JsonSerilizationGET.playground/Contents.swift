import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true // KEEP CODE RUNNING UNTILE WE GET DATA


//If you want to parse JSON by hand rather than using Codable,
//iOS has a built-in alternative called JSONSerialization and
//it can convert a JSON string into a collection of dictionaries,
//arrays, strings and numbers in just a few lines of code.


// WE USE JSON SERILZATION WHEN WE NEED TO SEND DATA TO SERVER OR RECEIVER DATA FROM SERVER IN JASON FORMATE YOU CAN USE IT


func getData()
{
    // https://jsonplaceholder.typicode.com/posts/1
    let session = URLSession.shared
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    let task = session.dataTask(with: url)
    { (serviceData , serviceResponse , error) in
        
        if error == nil
        {
            let httpResponse = serviceResponse as! HTTPURLResponse
            
            guard  httpResponse.statusCode ==  200 else {return}
            do
            {
                
           // WE CAN ALSO SEND DATA TO SERVER USING JSON SERILIZAITON
                // let data =JSONsrilizato.data(withjsonobject:DICt , option: .prettyprinted)
                // if let val = string(data:data , encoding: .utf8)
                //{ print(val) }
                
            
                let jsonObject = try? JSONSerialization.jsonObject(with: serviceData! , options: .mutableContainers)
            //print(jsonObject)
                let result = jsonObject as! Array<Any>
                let val = result[0] as! Dictionary<String , Any>
                print(result[0])
                print(val["body"])
              
                
                
            
            }catch{
                print("SOME THING WENT WRONg")
            }
            
        }
        
    }
    task.resume()
    
        
}


// TEHRE AN ANOTHER WAY TO GET DATA FROM URL USING URLREQUEST
func getDataagain()
{
    let session = URLSession.shared
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "get"
    
    let task = session.dataTask(with: urlRequest)
    { (serviceData , serviceResponse , error) in
        
        if serviceData != nil
        {
            let val = String(data: serviceData!, encoding: .utf8)
            debugPrint(val)
        }
        
    }
    task.resume()
}

getDataagain()



