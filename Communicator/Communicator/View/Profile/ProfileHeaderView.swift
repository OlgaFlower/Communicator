//
//  ProfileHeaderView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.11.23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: ProfileViewModel
    private let imageWidth = 72.0
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                self.imageView
                Spacer()
                HStack(spacing: 12.0) {
                    UserStatView(value: self.viewModel.user.statistic?.posts ?? 0, title: "Post")
                    UserStatView(value: self.viewModel.user.statistic?.followers ?? 0, title: "Followers")
                    UserStatView(value: self.viewModel.user.statistic?.following ?? 0, title: "Following")
                }
            }
            .padding(.horizontal)
            self.usernameView
            
            if let bio = self.viewModel.user.bio {
                self.userBioView(bio)
            }
        }
        
        HStack {
            Spacer()
            ProfileActionButtonView(viewModel: self.viewModel)
            Spacer()
        }
    }
    
    // MARK: - Views
    private var imageView: some View {
        UserImageView(userImgUrl: self.viewModel.user.profileImageUrl ?? "")
            .frame(width: self.imageWidth, height: self.imageWidth)
    }
    
    private var usernameView: some View {
        Text(self.viewModel.user.fullName)
            .font(.system(size: 15.0, weight: .semibold))
            .padding(.top)
            .padding(.leading)
    }
    
    
    private func userBioView(_ bio: String) -> some View {
        Text(bio)
            .font(.system(size: 15.0))
            .padding(.leading)
            .padding(.top, 1.0)
    }
}

// MARK: - Preview
#Preview {
    ProfileHeaderView(
        viewModel: ProfileViewModel(
            user: User(
                userName: "Casto",
                email: "",
                profileImageUrl: "",
                fullName: "Leipkas Jimfok",
                id: ""
            )
        )
    )
}
