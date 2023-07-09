



import Firebase
import UIKit

typealias FirestoreCompletion = (Error?)->Void

struct PostService
{
    static func uploadPost(caption:String , image:UIImage , completion:@escaping(FirestoreCompletion))
    {
        guard let uid = Auth.auth().currentUser?.uid else{return}
        
        ImageUploader.uploadImage(image: image) { imgUrl in
            let data = [
                "caption":caption,
                "timestamp":Timestamp(date: Date()),
                "likes":0,
                "imageUrl":imgUrl,
                "ownerUid":uid] as [String:Any]
            
            COLLECTION_POST.addDocument(data: data, completion:completion)
        }
        
    }
    
    static func fecthPosts( completion:@escaping([Post])->Void)
    {
        COLLECTION_POST.getDocuments { snapshot, error in
            
            guard let document = snapshot?.documents else {return}
            
            let data = document.map{
                itr in
                Post(postId: itr.documentID, itr.data())
            }
            completion(data)
           
        }
    }
    
    
}
