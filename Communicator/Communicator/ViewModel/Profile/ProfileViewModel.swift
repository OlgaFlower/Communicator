//
//  ProfileViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 24.11.23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    // MARK: - Properties
    let user: User
    
    // MARK: - Initializator
    init(user: User) {
        self.user = user
    }
    
    // MARK: - Functions
    func follow() {
        guard let uid = self.user.id else { return }
        UserService.follow(uid: uid) { error in
            // TODO: - Handle error
            print("Successfully followed \(self.user.userName)")
        }
    }
    
    func unfollow() {
        print("DEBUG: Unfollow user...")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
