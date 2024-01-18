//
//  ProfileViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 24.11.23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    // MARK: - Properties
    @Published var user: User
    
    // MARK: - Initializator
    init(user: User) {
        self.user = user
        self.checkIfUserIsFollowed()
        self.fetchUserStatistic()
    }
    
    // MARK: - Functions
    func follow() {
        guard let uid = self.user.id else { return }
        UserService.follow(uid: uid) { error in
            // TODO: - Handle error
            
            self.user.isFollowed = true
            
            NotificationsViewModel.uploadNotification(
                toUid: uid,
                type: .follow
            )
        }
    }
    
    func unfollow() {
        guard let uid = self.user.id else { return }
        UserService.unfollow(uid: uid) { error in
            // TODO: - Handle error
            
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return }
        guard let uid = self.user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserStatistic() {
        guard let uid = user.id else { return }
        
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _ in
            guard let following = snapshot?.documents.count else { return }
            
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
                guard let followers = snapshot?.documents.count else { return }
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                    guard let posts = snapshot?.documents.count else { return }
                    
                    self.user.statistic = UserStatisticModel(
                        following: following,
                        posts: posts,
                        followers: followers
                    )
                    
                    print("STATISTIC - \(self.user.statistic)")
                }
            }
        }
    }
}
