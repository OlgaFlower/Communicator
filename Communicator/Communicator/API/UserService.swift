//
//  UserService.swift
//  Communicator
//
//  Created by Olha Bereziuk on 24.11.23.
//

import Firebase

typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    
    static func follow(uid: String, completion: FirestoreCompletion) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        /// start to follow smb
        COLLECTION_FOLLOWING.document(currentUid)
            .collection("user-following").document(uid).setData([:]) { _ in
                
                /// add curret user uid to the followers list of the person we want to follow
                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
                    .document(currentUid).setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: FirestoreCompletion) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).delete { _ in
                
                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
                    .document(currentUid).delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            .document(uid).getDocument { snapshot, error in
                
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }
    }
}
