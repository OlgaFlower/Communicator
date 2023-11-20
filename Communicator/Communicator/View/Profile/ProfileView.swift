//
//  ProfileView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView()
                PostGridView()
            }
            .padding(.top)
        }
    }
}

// MARK: - Preview
#Preview {
    ProfileView()
}
