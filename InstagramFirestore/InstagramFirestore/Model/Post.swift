//
//  Post.swift
//  InstagramFirestore
//
//  Created by jahanzaib on 09/07/2023.
//

import Firebase
import Foundation

struct Post
{
    var caption:String
    var likes:Int
    var imageURL:String
    var ownerUid:String
    var timestamp: Timestamp
    var postId:String
    
    init(postId:String,_ dict: [String : Any])
    {
        self.postId = postId
        self.caption = dict["caption"] as? String ?? " "
        self.likes = dict["likes"] as? Int ?? 0
        self.imageURL = dict["imageUrl"] as? String ?? " "
        self.timestamp = dict["timestamp"] as? Timestamp ?? Timestamp(date:Date())
        self.ownerUid = dict["ownerUid"] as? String ?? " "
        
    }
}
