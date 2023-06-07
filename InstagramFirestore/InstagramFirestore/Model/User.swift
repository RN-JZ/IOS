





import Foundation


struct User
{
    let email:String
    let fullName:String
    let profileImgeURL:String
    let userName:String
    let uid:String
    
    
    init(_ dict: [String : Any])
    {
        self.email = dict["email"] as? String ?? " "
        self.fullName = dict["fullName"] as? String ?? " "
        self.profileImgeURL = dict["profileImageUrl"] as? String ?? " "
        self.userName = dict["userName"] as? String ?? " "
        self.uid = dict["uid"] as? String ?? " "
    }
}
