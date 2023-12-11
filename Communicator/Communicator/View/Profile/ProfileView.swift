//
//  ProfileView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: ProfileViewModel
    let user: User
    
    // MARK: - Initializator
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: self.viewModel)
                PostGridView(type: .profile(self.user.id ?? ""))
            }
            .padding(.top)
        }
    }
}

