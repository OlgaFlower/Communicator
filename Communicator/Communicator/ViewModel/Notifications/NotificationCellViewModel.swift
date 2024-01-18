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
    
    // TODO: - Refactor timestampString property duplication
    var timestampString: String {
        guard let timestamp = self.notification.post?.timestamp.dateValue() else { return "" }
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp, to: Date()) ?? ""
    }
    
    // MARK: - Initializator
    init(notification: NotificationModel) {
        self.notification = notification
        self.checkIfUserIsFollowed()
        self.fetchNotificationPost()
        self.fetchNotificationUser()
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
    
    func fetchNotificationUser() {
        COLLECTION_USERS.document(self.notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: User.self)
            
            print("DEBUG: User is \(self.notification.user?.userName)")
        }
    }
}
