//
//  NotificationModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 05.01.24.
//

import FirebaseFirestore

// This model displays for current user (me) data of people who liked or commented its (my) posts

struct NotificationModel: Identifiable, Codable {
    @DocumentID var id: String?
    let postId: String?
    let userName: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String // uid of the person who sent that notification
    
    var isFollowed: Bool? = false //do I follow this guy?
    var post: PostModel?
    var user: User? //person who liked or commented my post
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
