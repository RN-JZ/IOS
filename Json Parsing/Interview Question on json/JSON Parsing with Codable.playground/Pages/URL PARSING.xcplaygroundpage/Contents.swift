//: [Previous](@previous)


import UIKit


struct Data: Decodable{
    let id: Int
    let name, role, joining: String
    let depid, salary: Int
    let workPhone: String
}

//struct HttpUtility
//{
//    func getAPIData<T:Decodable>(requestURL:URL , resultType:T.Type,completionHandler: @escaping(_ result:T)->Void)
//    {
//        URLSession.shared.dataTask(with: requestURL)
//        {
//            (response , Httpresponse , error)  in
//            if(error == nil && response != nil && response?.count != 0)
//            {
//                do{
//                    let result = try JSONDecoder().decode(T.self, from: response!)
//                    completionHandler(result)
//
//                }catch{
//                    print("SOMETHING WNT WRONG")
//                }
//
//            }
//
//        }.resume()
//
//    }
//
//}

enum DemoError:Error
{
    case BADURL
    case NODATA
    case DECODING_ERROR
}
class Employee
{
    
    func getData(completion:@escaping(Result<Data, DemoError>)->Void)
  {
    guard let url = URL(string: "http://demo5197163.mockable.io/")
            else
            {
                completion(.failure(.BADURL))
                return
            }
    
      URLSession.shared.dataTask(with: url) { data, response, error in
          
          guard let data = data , error == nil else{
              completion(.failure(.NODATA))
              return
          }
          
          let dataDecode = try? JSONDecoder().decode(Data.self, from: data)
          guard let dataDecode = dataDecode else {
              completion(.failure(.DECODING_ERROR))
              return
          }
          completion(.success(dataDecode))
          
          
          
      }.resume()}
    
    func printData()
    {
        getData { result in
            switch result
            {
            case .success(let data):
                print(data)
            case .failure(let errordata):
                print(errordata)
            }
        }
    }
}

var obj = Employee()
obj.printData()


//: [Next](@next)
