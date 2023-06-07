

import Foundation
import FirebaseStorage
import UIKit

struct ImageUploader
{
    //  WHEN WE UPLOAD IMAGE IN STORAGE WE ALOS NEED SOME URL BACK TO KNOW THAT THIS PERSON HAS THIS IMAGE ASSOCIATED WITH THIS ACCOUNT SO WHEN IMAGE UPLAOD IN DONE IT GIVE US URL WHICH WE CAN ADD IN DATABASE
    
    // WE MAKE IT STATIC SO WE CAN EASILY ACESS IT ANYWHERE OTHER WISE WE HAVE TO MAKE OBJECT OF IMAGEULOADER
    // AND WE KNOW ABOUt escaping
    static func uploadImage(image:UIImage , completion:@escaping(String)->Void)
    {
        // FIRST WE MAKE IMAHE IN JPEC AND COMPRESS SO ITS EASY TO UPLOAD AND DOWNLOAD
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
        
        // EVER IMAGE IS GOING TO HAVE SONE NAME TO GIVE EACH OF THEM A UNIQUE NAME WE USE UUIDSTRING AND THEM AMKE OBEJCT OF STORAGE
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        // NOW PUT DATA IN STORAGE
        ref.putData(imageData, metadata: nil) { metadata, error in
            
            if let error = error
            {
                print("Failed to upload images \(error.localizedDescription)")
                return
            }
            // WE NEED THE URL TO PUT IN DATABASE
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
            
            
            
        }
    }
}
