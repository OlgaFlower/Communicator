//
//  LikesViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.12.23.
//

import SwiftUI

class LikesViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var users = [User]()
    private var postId: String?
    
    // MARK: - Init
    init(postId: String?) {
        self.postId = postId
        self.fetchLikes()
    }
    
    // MARK: - Functions
    func fetchLikes() {
        
        guard let postId = postId else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").getDocuments { snapshot, _ in
            guard let likedUsersId = snapshot?.documents else { return }
            
            let userIds = likedUsersId.compactMap { try? $0.data(as: LikeModelTest.self) }
            
            userIds.forEach { userId in
                guard let id = userId.id else { return }
                
                COLLECTION_USERS.document(id).getDocument(as: User.self) { document in
                    guard let user = try? document.get() else { return }
                    
                    self.users.append(user)
                }
            }
        }
    }
}
