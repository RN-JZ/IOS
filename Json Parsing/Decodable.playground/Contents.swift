import UIKit


struct Welcome: Decodable{
    let id: Int
    let name, role, joining: String
    let depid, salary: Int
    let workPhone: String
}

struct HttpUtility
{
    func getAPIData<T:Decodable>(requestURL:URL , resultType:T.Type,completionHandler: @escaping(_ result:T)->Void)
    {
        URLSession.shared.dataTask(with: requestURL)
        {
            (response , Httpresponse , error)  in
            if(error == nil && response != nil && response?.count != 0)
            {
                do{
                    let result = try JSONDecoder().decode(T.self, from: response!)
                    completionHandler(result)
                    
                }catch{
                    print("SOMETHING WNT WRONG")
                }
                
            }
            
        }.resume()
        
    }
    
}


// THE THING TO NOTIC HERE IS THAT THIS FUNCTION IS ONLY WORK WITH SEPECIFIC URL OR SUCH URL WHICH WE GOING TO SEND IN FUNCTION AS ARGUMENT
// IF WE HAVE DIFFERENT JSON DATA WE NEED TO USE JSONDECODER DIFFERENTLY
// TO OVER COME THIS PROBLEM WE WILL GENERATE A GENERIC FUNCTION

struct Employee
{
    
    let httputility:HttpUtility
    init(_ http:HttpUtility)
    {
        self.httputility = http
    }
  func getData()
  {
    var url = URL(string: "http://demo5197163.mockable.io/")
    
    guard let data = url else {return }
     httputility.getAPIData(requestURL: data , resultType:Welcome.self)
     {
         result in
         if(result != nil)
         {
             print(result.id)
         }
         else{
             print("DATA IS NIL")
         }
     }
 
 }
}

var obj = Employee(HttpUtility())
obj.getData()



