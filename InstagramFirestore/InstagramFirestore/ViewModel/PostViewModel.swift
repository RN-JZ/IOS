//
//  PostViewModel.swift
//  InstagramFirestore
//
//  Created by jahanzaib on 09/07/2023.
//

import Foundation

struct PostViewModel
{
    private let post :Post
    
    var imageURL:URL?
    {
        return URL(string: post.imageURL)
    }
    
    var caption:String
    {
        return post.caption
    }
    
    init(post:Post)
    {
        self.post = post
    }
}
