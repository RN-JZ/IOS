
import Foundation


struct UserCellViewModel
{
    let user:User
    
    var fullName:String
    {
        return user.fullName
    }
    var userName:String
    {
        return user.userName
    }
    var profileImage:URL?
    {
        return URL(string:user.profileImgeURL)
    }
    
   init(_ user:User)
    {
        self.user = user
    }
}

