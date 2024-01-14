//
//  NotificationModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 05.01.24.
//

import FirebaseFirestore

struct NotificationModel: Identifiable, Codable {
    @DocumentID var id: String?
    let postId: String?
    let userName: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String // uid of the person who sent that notification
}

enum NotificationType: Int, Codable {
    case like    = 0
    case comment = 1
    case follow  = 2
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on one of your posts."
        case .follow: return " started following you."
        }
    }
}
