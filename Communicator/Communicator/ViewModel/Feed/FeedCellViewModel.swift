//
//  FeedCellViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 13.12.23.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var post: PostModel
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    // MARK: - Init
    init(post: PostModel) {
        self.post = post
        self.checkIfUserLikedPost()
    }
    
    // MARK: - Functions
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = self.post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(uid).setData([:]) { _ in
                
                COLLECTION_USERS.document(uid).collection("user-likes")
                    .document(postId).setData([:]) { _ in
                        
                        COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes + 1])
                        
                        self.post.didLike = true
                        self.post.likes += 1
                    }
        }
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = self.post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
                
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes - 1])
                
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = self.post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId)
            .getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.post.didLike = didLike
        }
    }
}
