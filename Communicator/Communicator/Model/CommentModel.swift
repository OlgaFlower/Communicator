//
//  CommentModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.12.23.
//

import Foundation
import FirebaseFirestore

struct CommentModel: Identifiable, Codable {
    @DocumentID var id: String?
    let userName: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timeStamp: Timestamp
    let uid: String
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timeStamp.dateValue(), to: Date()) ?? ""
    }
}
