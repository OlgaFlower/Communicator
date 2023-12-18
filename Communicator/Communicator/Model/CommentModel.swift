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
}
