




import Firebase
import FirebaseFirestore
import UIKit

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
    
    static func follow(uid : String , completion: @escaping(String)->Void)
    {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }

        COLLECTION_FOLLOWERS.document(uid).collection("user-Followers").document(currentUid).setData([:]) { error in
            if let error = error {
                // Handle the error
                print("Error setting data: \(error.localizedDescription)")
                return
            }

            COLLECTION_FOLLOWING.document(currentUid).collection("user-Following").document(uid).setData([:]) { error in
                if let error = error {
                    // Handle the error
                    print("Error setting data: \(error.localizedDescription)")
                    return
                }

                // Data successfully set
                print("Data set successfully")
                // Call completion handler or perform any other necessary actions
                completion("Sucesss")
            }
        }

                                                                                            
    }
    
    static func unfollow(uid : String , completion: @escaping(Error)->Void)
    {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }

        COLLECTION_FOLLOWERS.document(uid).collection("user-Followers").document(currentUid).delete{ error in
            if let error = error {
                // Handle the error
                print("Error setting data: \(error.localizedDescription)")
                return
            }

            COLLECTION_FOLLOWING.document(currentUid).collection("user-Following").document(uid).delete{ error in
                if let error = error {
                    // Handle the error
                    print("Error setting data: \(error.localizedDescription)")
                    return
                }

                // Data successfully set
                print("Data set successfully")
                // Call completion handler or perform any other necessary actions
            }
        }}
    static func checkifUserisFollowed(uid : String , completion: @escaping(Bool)->Void)
    {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-Following").document(uid).getDocument{
            (snapshot , error) in
            guard let isFollowed = snapshot?.exists else{return}
            completion(isFollowed)
        }
    }
    
    static func fetchUserStats(uid : String , completion: @escaping(UserStats)->Void)
    {
        COLLECTION_FOLLOWERS.document(uid).collection("user-Followers").getDocuments{
            (snapshot , _ )
            in
            
            let followers = snapshot?.documents.count ?? 0
            
            COLLECTION_FOLLOWING.document(uid).collection("user-Following").getDocuments{
                
                (snapshot , _)
                in
                let following = snapshot?.documents.count ?? 0
                
                completion(UserStats(followers: followers, following: following))
                
            }
            
        }
        
    }
}
