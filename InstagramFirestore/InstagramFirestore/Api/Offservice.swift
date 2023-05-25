
import UIKit
//import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


struct AuthCredentials
{
    let email:String
    let password:String
    let fullName:String
    let userName:String
    let profileImage:UIImage
}

struct AuthService
{
    
    static func registerUser(withCredential credential:AuthCredentials , completion: @escaping(Error?) -> Void )
    {
        ImageUploader.uploadImage(image: credential.profileImage){ url in
           //After geeting URL WE NEED TO ADD DATA IN AUTH
            Auth.auth().createUser(withEmail: credential.email, password: credential.password) { result, error in
                if let error = error
                {
                    print("AUTH FAIL \(error.localizedDescription)")
                    return
                }
                
                
                guard let uuid = result?.user.uid else {return}
                let data : [String:Any] = [
                    "email": credential.email ,
                    "fullName": credential.fullName,
                    "profileImageUrl":url,
                    "uid":uuid,
                    "userName":credential.userName]
                
                Firestore.firestore().collection("users").document(uuid).setData(data , completion: completion)
             
            }
            
        }
    }
}
