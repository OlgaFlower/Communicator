//
//  CommentViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.12.23.
//

import Foundation
import Firebase

class CommentViewModel: ObservableObject {
    
    // MARK: - Properties
    private var post: PostModel
    
    // MARK: - Init
    init(post: PostModel) {
        self.post = post
    }
    
    func uploadComment(_ commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        
        let data: [String : Any] = ["userName" : user.userName,
                                    "profileImageUrl" : user.profileImageUrl,
                                    "uid" : user.id ?? "",
                                    "timeStamp" : Timestamp(date: Date()),
                                    "postOwnerUid" : post.ownerUid,
                                    "commentText" : commentText]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let eror = error {
                print("DEBUG: Error uploading comment \(error?.localizedDescription)")
                return
            }
        }
    }
    
    func fetchComments() {
        
    }
}
