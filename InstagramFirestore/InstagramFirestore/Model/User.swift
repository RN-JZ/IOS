





import Foundation
import Firebase


struct User
{
    let email:String
    let fullName:String
    let profileImgeURL:String
    let userName:String
    let uid:String
    var stats: UserStats!
    var isFollowed = false
    var currentUser:Bool
    {
        return Auth.auth().currentUser?.uid == uid
    }
    
    
    init(_ dict: [String : Any])
    {
        self.email = dict["email"] as? String ?? " "
        self.fullName = dict["fullName"] as? String ?? " "
        self.profileImgeURL = dict["profileImageUrl"] as? String ?? " "
        self.userName = dict["userName"] as? String ?? " "
        self.uid = dict["uid"] as? String ?? " "
        self.stats = UserStats(followers: 0, following: 0)
    }
}

struct UserStats
{
    let followers:Int
    let following:Int
    
}
