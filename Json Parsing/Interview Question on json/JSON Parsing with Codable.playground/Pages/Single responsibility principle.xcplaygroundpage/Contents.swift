


import UIKit
import Foundation



// SINGLE RESPOSINBILITY MEANS EACH CLASS SHOULD PERSORM ONLY ONE TASK
// LIKE ONE CLASS GET DATA AND OTHR CLASS WITH DECODE IT

struct EmployeeData: Decodable {
    let id: Int
    let name, role, joining: String
    let depid, salary: Int
    let workPhone: String
}

enum DemoError: Error {
    case BADURL
    case NODATA
    case DECODING_ERROR
}

class Employee {
    let apiHandler: APIHandler
    let responseHandler: ResponseHandler

    init(apiHandler: APIHandler = APIHandler(), responseHandler: ResponseHandler = ResponseHandler()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }

    func getData() {
        guard let url = URL(string: "http://demo5197163.mockable.io/") else {
            return
        }

        apiHandler.getEmployeeData(url: url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.handleEmployeeData(data: data) { result in
                    switch result {
                    case .success(let decodedData):
                        print(decodedData)
                    case .failure(let error):
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

class APIHandler {
    func getEmployeeData(url: URL, completion: @escaping (Result<Data, DemoError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.NODATA))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

class ResponseHandler {
    func handleEmployeeData(data: Data, completion: @escaping (Result<EmployeeData, DemoError>) -> Void) {
        do {
            let decodedData = try JSONDecoder().decode(EmployeeData.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(.DECODING_ERROR))
        }
    }
}

let obj = Employee()
obj.getData()





