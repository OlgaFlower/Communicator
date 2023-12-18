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
    @Published var comments = [CommentModel]()
    
    private var post: PostModel
    
    // MARK: - Init
    init(post: PostModel) {
        
        self.post = post
        self.fetchComments()
    }
    
    // MARK: - Functions
    func uploadComment(_ commentText: String) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        guard !commentText.isEmpty else { return }
        
        let data: [String : Any] = ["userName" : user.userName,
                                    "profileImageUrl" : user.profileImageUrl ?? "",
                                    "uid" : user.id ?? "",
                                    "timeStamp" : Timestamp(date: Date()),
                                    "postOwnerUid" : post.ownerUid,
                                    "commentText" : commentText]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: Error uploading comment \(error.localizedDescription)")
                return
            }
        }
    }
    
    func fetchComments() {
        
        guard let postId = post.id else { return }
        
        let query = COLLECTION_POSTS.document(postId).collection("post-comments")
            .order(by: "timeStamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.comments.insert(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: CommentModel.self) }), at: 0)
        }
    }
}
