
import Foundation
import UIKit


struct ProfileHeaderViewModel
{
    let user:User
    
    var fullName:String
    {
        return user.userName
    }
    var profileImage:URL?
    {
        return URL(string:user.profileImgeURL)
    }
    var FollowedButtonText:String
    {
        print("THE FOLLOW IS \(user.isFollowed)")
        return user.currentUser ? "EDIT PROFILE" : user.isFollowed ? "Followed" :"Follow"
    }
    var followButtonBackgroundColor:UIColor
    {
        return user.currentUser ? .white : .systemBlue
    }
    var followButtonTextColor:UIColor
    {
        return user.currentUser ? .black : .white
    }
    
    var numberOfFollowers:NSAttributedString
    {
        return attributedStatText(value: user.stats.followers, label: "followers")
    }
    var numberOfFollowing:NSAttributedString
    {
        return attributedStatText(value: user.stats.following, label: "following")
    }
    var numberOfPosts:NSAttributedString
    {
        return attributedStatText(value: 6, label: "Posts")
    }
    
    
   init(_ user:User)
    {
        self.user = user
    }
    
    func attributedStatText(value:Int , label:String)->NSAttributedString
    {
        let attrText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font:UIFont.boldSystemFont(ofSize: 14)])
        attrText.append(NSAttributedString(string: label, attributes: [.font:UIFont.systemFont(ofSize: 14) , .foregroundColor:UIColor.lightGray]))
        return attrText
    }
}
