//
//  NotificationsViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 05.01.24.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    
    @Published var notifications = [NotificationModel]()
    
    init() {
        self.fetchNotifications()
    }

    func fetchNotifications() {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications")
        
        query.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            self.notifications = documents.compactMap({ try? $0.data(as: NotificationModel.self) })
        }
    }
    
    // TODO: - refactor static access to dependency inj.
    static func uploadNotification(toUid uid: String, type: NotificationType, post: PostModel? = nil) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        var data: [String: Any] = [
            "timestamp" : Timestamp(date: Date()),
            "userName" : user.userName,
            "uid" : user.id ?? "", //current user
            "profileImageUrl" : user.profileImageUrl ?? "",
            "type" : type.rawValue
        ]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        // uid -> id of the post owner, for example
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
