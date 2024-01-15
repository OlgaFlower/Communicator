//
//  NotificationCellViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 15.01.24.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var notification: NotificationModel
    
    // MARK: - Initializator
    init(notification: NotificationModel) {
        self.notification = notification
        self.checkIfUserIsFollowed()
        self.fetchNotificationPost()
    }
    
    // MARK: - Functions
    
    func follow() {
        UserService.follow(uid: self.notification.uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: self.notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard self.notification.type == .follow else { return }
        UserService.checkIfUserIsFollowed(uid: self.notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
    func fetchNotificationPost() {
        guard let postId = self.notification.postId else { return }
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: PostModel.self)
        }
    }
}
