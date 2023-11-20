//
//  ProfileHeaderView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.11.23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                self.imageView
                Spacer()
                
                HStack(spacing: 12) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 4, title: "Following")
                }
            }
            .padding(.horizontal)
            self.usernameView
            self.userDescriptionView
        }
        
        HStack {
            Spacer()
            ProfileActionButtonView()
            Spacer()
        }
    }
    
    // MARK: - Views
    private var imageView: some View {
        Image("avatar4")
            .resizable()
            .scaledToFill()
            .frame(width: 72, height: 72)
            .clipShape(Circle())
    }
    
    private var usernameView: some View {
        Text("Bahiti Abdelaal")
            .font(.system(size: 15.0, weight: .semibold))
            .padding(.top)
            .padding(.leading)
    }
    
    private var userDescriptionView: some View {
        Text("UI/UX Designer | Blogger")
            .font(.system(size: 15.0))
            .padding(.leading)
            .padding(.top, 1)
    }
}

// MARK: - Preview
#Preview {
    ProfileHeaderView()
}
