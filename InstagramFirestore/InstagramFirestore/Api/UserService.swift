




import Firebase

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
}
