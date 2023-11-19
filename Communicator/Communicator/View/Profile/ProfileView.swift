//
//  ProfileView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct ProfileView: View {
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

#Preview {
    ProfileView()
}
