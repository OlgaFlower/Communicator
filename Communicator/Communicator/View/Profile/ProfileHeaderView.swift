//
//  ProfileHeaderView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.11.23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    // MARK: - Properties
    let user: User
    private let imageWidth = 72.0
    
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
            ProfileActionButtonView(isCurrentUser: self.user.isCurrentUser)
            Spacer()
        }
    }
    
    // MARK: - Views
    private var imageView: some View {
        UserImageView(userImgUrl: self.user.profileImageUrl ?? "")
            .frame(width: self.imageWidth, height: self.imageWidth)
    }
    
    private var usernameView: some View {
        Text(self.user.fullName)
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
    ProfileHeaderView(user: User(userName: "niko_20", email: "", profileImageUrl: "", fullName: "Alice Wiver"))
}
