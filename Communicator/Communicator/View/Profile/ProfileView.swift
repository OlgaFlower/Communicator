//
//  ProfileView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Properties
    let user: User
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(user: self.user)
                PostGridView()
            }
            .padding(.top)
        }
    }
}

