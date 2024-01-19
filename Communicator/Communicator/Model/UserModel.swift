//
//  CurrentUserModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 22.11.23.
//

import FirebaseFirestore

struct User: Identifiable, Codable {
    let userName: String
    let email: String
    let profileImageUrl: String?
    let fullName: String
    @DocumentID var id: String?
    var bio: String?
    var statistic: UserStatisticModel?
    var isFollowed: Bool?
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}

struct UserStatisticModel: Codable {
    var following: Int
    var posts: Int
    var followers: Int
}
