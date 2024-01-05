//
//  NotificationsViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 05.01.24.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    
    @Published var notifications = [Notification]()
    
    func fetchNotifications() {
        
    }
    
    static func uploadNotification(toUid uid: String, type: NotificationType, post: PostModel? = nil) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        var data: [String: Any] = [
            "timestamp" : Timestamp(date: Date()),
            "userName" : user.userName,
            "uid" : user.id ?? "", //current user
            "profileImageUrl" : user.profileImageUrl,
            "type" : type.rawValue
        ]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        // uid -> id of the post owner, for example
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
