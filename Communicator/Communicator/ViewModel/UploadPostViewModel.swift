//
//  UploadPostViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 28.11.23.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            
            let data = ["caption" : caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl ?? "",
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl ?? "",
                        "ownerUserName": user.userName] as [String: Any]
            
            COLLECTION_POSTS.addDocument(data: data) { error in
                // TODO: Handle error
                
                print("DEBUG: Uploaded post")
            }
        }
    }
}
