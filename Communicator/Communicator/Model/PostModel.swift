//
//  PostModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 11.12.23.
//

import FirebaseFirestore
import Firebase

struct PostModel: Identifiable, Codable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUserName: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
}
