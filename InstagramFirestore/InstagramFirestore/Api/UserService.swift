




import Firebase
import FirebaseFirestore

struct UserService
{
    static func fetchUser(completion: @escaping(User)->Void)
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USER.document(uid).getDocument
        { snapshot, error in
        
            guard error == nil else
            {
                print("DEBUG THE ERROR IS \(error)")
             return

            }
            
            guard let dict = snapshot?.data() else {return}
            
            let user = User(dict)
            
            completion(user)
            
        }
    }
    
    static func fetchAllUser(completion: @escaping([User])->Void)
    {
       
        var user:[User] = []
        COLLECTION_USER.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let querySnapshot = querySnapshot else {return}
//                for document in querySnapshot!.documents {
//                    let userData = document.data()
//                    user.append(User(userData))
//                }
               user =  querySnapshot.documents.map({User($0.data())})
                completion(user)
            }
        }
    }
}
